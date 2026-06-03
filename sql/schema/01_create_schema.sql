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