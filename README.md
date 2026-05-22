# 🏏 Athlete Brand Equity Engine

![Status](https://img.shields.io/badge/Status-Work%20In%20Progress-yellow)
![Python](https://img.shields.io/badge/Python-3.11-blue)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue)
![dbt](https://img.shields.io/badge/dbt-Core-orange)
![License](https://img.shields.io/badge/License-MIT-green)

> Correlating IPL cricket player performance with social media influence
> to identify overrated vs underrated players for fantasy sports and brand valuation.

---

## 🧠 Problem Statement

Most sports analytics looks at match stats in isolation.
Most social media analytics looks at followers in isolation.
This project connects both — modeling a player's true market value
using performance AND public influence data.

---

## 🏗️ Tech Stack

| Layer | Tool |
|-------|------|
| Database | PostgreSQL 15 |
| Transformation | dbt Core |
| Data Generation | Python 3.11 |
| Orchestration | Apache Airflow (coming soon) |
| Visualization | Metabase (coming soon) |
| Version Control | Git + GitHub |

---

## 📁 Project Structure
athlete-brand-equity-engine/
├── sql/
│   ├── schema/        → Database DDL
│   └── analyses/      → Advanced SQL queries
├── data_generator/    → Python data scripts
├── data/              → CSV files (git-ignored)
├── dbt/               → dbt models and tests
└── docs/              → Architecture diagrams
---

## 🚀 Status

- [x] Project setup and folder structure
- [ ] Schema design (star schema)
- [ ] Data generation / Kaggle transformation
- [ ] SQL analyses (window functions, CTEs)
- [ ] dbt models and tests
- [ ] Metabase dashboard

---

## 📄 License
MIT

