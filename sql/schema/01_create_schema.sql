-- ============================================================
-- ATHLETE BRAND EQUITY ENGINE
-- File: sql/schema/01_create_schema.sql
-- ============================================================

-- SCHEMAS
CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS marts;
CREATE SCHEMA IF NOT EXISTS analyses;

-- ============================================================
-- DIM: PLAYERS
-- ============================================================
CREATE TABLE IF NOT EXISTS staging.dim_players (
    player_id       SERIAL PRIMARY KEY,
    player_name     VARCHAR(100) NOT NULL,
    country         VARCHAR(50),
    batting_style   VARCHAR(30),
    bowling_style   VARCHAR(50),
    playing_role    VARCHAR(30),
    ipl_debut_year  INT,
    is_active       BOOLEAN DEFAULT TRUE,
    created_at      TIMESTAMP DEFAULT NOW()
);

-- ============================================================
-- DIM: TEAMS
-- ============================================================
CREATE TABLE IF NOT EXISTS staging.dim_teams (
    team_id             SERIAL PRIMARY KEY,
    team_name           VARCHAR(100) NOT NULL,
    team_short_name     VARCHAR(10),
    home_city           VARCHAR(50),
    franchise_owner     VARCHAR(100),
    founded_year        INT,
    created_at          TIMESTAMP DEFAULT NOW()
);

-- ============================================================
-- DIM: DATES
-- ============================================================
CREATE TABLE IF NOT EXISTS staging.dim_dates (
    date_id             DATE PRIMARY KEY,
    day_of_week         VARCHAR(10),
    week_number         INT,
    month               INT,
    month_name          VARCHAR(15),
    quarter             INT,
    year                INT,
    ipl_season          INT,
    is_weekend          BOOLEAN,
    created_at          TIMESTAMP DEFAULT NOW()
);
-- ============================================================
-- DIM: EVENTS
-- Viral moments, controversies, awards, injuries
-- ============================================================
CREATE TABLE IF NOT EXISTS staging.dim_events (
    event_id                SERIAL PRIMARY KEY,
    player_id               INT REFERENCES staging.dim_players(player_id),
    event_date              DATE NOT NULL,
    event_type              VARCHAR(50),   -- 'record_broken', 'controversy', 'award', 'injury', 'viral_moment'
    event_name              VARCHAR(200),
    event_description       TEXT,
    sentiment               VARCHAR(10) CHECK (sentiment IN ('positive','negative','neutral')),
    media_coverage_score    INT CHECK (media_coverage_score BETWEEN 1 AND 10),
    created_at              TIMESTAMP DEFAULT NOW()
);

-- ============================================================
-- DIM: BRAND CAMPAIGNS
-- Brand deals linked to players
-- ============================================================
CREATE TABLE IF NOT EXISTS staging.dim_brand_campaigns (
    campaign_id             SERIAL PRIMARY KEY,
    player_id               INT REFERENCES staging.dim_players(player_id),
    brand_name              VARCHAR(100),
    campaign_start_date     DATE,
    campaign_end_date       DATE,
    deal_value_tier         VARCHAR(20) CHECK (deal_value_tier IN ('low','medium','high','mega')),
    category                VARCHAR(50),   -- 'sportswear', 'beverage', 'fintech', etc.
    created_at              TIMESTAMP DEFAULT NOW()
);
CREATE TABLE fact_player_match_stats (
    match_id INT NOT NULL,
    player_id INT NOT NULL,
    team_id INT NOT NULL,
    opponent_team_id INT NOT NULL,

    match_date DATE NOT NULL,
    ipl_season VARCHAR(10),
    venue VARCHAR(100),

    -- Batting Stats
    runs_scored INT DEFAULT 0,
    balls_faced INT DEFAULT 0,
    fours INT DEFAULT 0,
    sixes INT DEFAULT 0,
    strike_rate NUMERIC(6,2),
    batting_position INT,
    is_out BOOLEAN,
    dismissal_type VARCHAR(50),

    -- Bowling Stats
    overs_bowled NUMERIC(4,1) DEFAULT 0,
    wickets_taken INT DEFAULT 0,
    runs_conceded INT DEFAULT 0,
    economy_rate NUMERIC(6,2),
    dot_balls INT DEFAULT 0,

    -- Fielding Stats
    catches INT DEFAULT 0,
    run_outs INT DEFAULT 0,

    -- Match Result
    match_result VARCHAR(20),
    player_of_match BOOLEAN DEFAULT FALSE,

    PRIMARY KEY (match_id, player_id),

    FOREIGN KEY (match_id)
        REFERENCES dim_match(match_id),

    FOREIGN KEY (player_id)
        REFERENCES dim_player(player_id),

    FOREIGN KEY (team_id)
        REFERENCES dim_team(team_id),

    FOREIGN KEY (opponent_team_id)
        REFERENCES dim_team(team_id)
);