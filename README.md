# Stori | Take-Home Test – dbt Project

## Introduction

This project demonstrates a simple data transformation workflow using **dbt** and **Snowflake**. It processes a sales dataset (`sales_data`) to produce total sales per customer, monthly order counts, and an incremental monthly aggregation. The goal is to show a professional, modular, and tested analytics workflow.

## Tools Used

- **dbt** – for modular, version-controlled SQL transformations, testing, and documentation.
- **Snowflake** – cloud data warehouse for storing and querying source and transformed data.
- **Git & GitHub** – version control and project history.
- **SQL** – for all transformations and tests.

## Project Structure

dbt-take-home-test/
├── analyses/                 # Placeholder for dbt analyses
├── macros/
│   └── test_no_negative.sql  # Custom macro for no negative values
├── models/
│   └── marts/                # Developed models
│       ├── customer_sales.sql
│       ├── orders_per_month.sql
│       ├── orders_per_month_incremental.sql
│       └── schema.yml        # Source definitions and model documentation
├── seeds/                    # Optional CSV seeds if needed
├── snapshots/                # Optional dbt snapshots
├── tests/                    # Custom tests for models integrity
│   ├── customer_sales_no_negative.sql
│   └── orders_per_month_no_negative.sql
├── dbt_project.yml           # Project configuration and materializations
└── README.md

## Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
