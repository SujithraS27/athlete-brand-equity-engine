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