# GCP Bitcoin Batch Data Pipeline

![GCP](https://img.shields.io/badge/Cloud-Google%20Cloud-blue)
![BigQuery](https://img.shields.io/badge/Warehouse-BigQuery-yellow)
![Python](https://img.shields.io/badge/Language-Python-green)
![Architecture](https://img.shields.io/badge/Data%20Architecture-Bronze%20Silver%20Gold-orange)

End-to-end batch data pipeline built on **Google Cloud Platform (GCP)** to process Bitcoin historical data using a **Bronze / Silver / Gold architecture**.

---

# Architecture

![Pipeline Architecture](architecture/pipeline_architecture.png)

---

# Project Overview

This project implements a **batch data pipeline on Google Cloud Platform** to ingest, transform, and analyze Bitcoin historical data.

The pipeline uses:

- **Cloud Storage** for raw file storage  
- **BigQuery** for data warehousing  
- **Cloud Run** for transformation logic  
- **Cloud Scheduler** for orchestration  

---

# Pipeline Flow

The pipeline follows a **multi-layer data architecture**:

1. **CSV Dataset**  
   Bitcoin historical data source.

2. **Cloud Storage**  
   Raw data is uploaded to a storage bucket.

3. **BigQuery Bronze Layer**  
   Raw data is ingested into the `bronze.bitcoin_raw` table.

4. **Cloud Run Transformation**  
   A Python service executes SQL transformations.

5. **BigQuery Silver Layer**  
   Cleaned data stored in `silver.bitcoin_prices`.

6. **BigQuery Gold Layer**  
   Analytical metrics stored in `gold.bitcoin_kpis`.

7. **Cloud Scheduler**  
   Triggers the pipeline automatically.

---

# Architecture Flow
CSV Dataset
↓
Cloud Storage
↓
BigQuery Bronze (bitcoin_raw)
↓
Cloud Run (Python + SQL transformations)
↓
BigQuery Silver (bitcoin_prices)
↓
BigQuery Gold (bitcoin_kpis)
↓
Cloud Scheduler


---

# GCP Services Used

- Google Cloud Storage
- BigQuery
- Cloud Run
- Cloud Scheduler
- IAM

---

# Data Model

## Bronze Layer

Dataset: `bronze`  
Table: `bitcoin_raw`

Contains raw ingested Bitcoin historical data.

---

## Silver Layer

Dataset: `silver`  
Table: `bitcoin_prices`

Contains cleaned and standardized Bitcoin price data.

---

## Gold Layer

Dataset: `gold`  
Table: `bitcoin_kpis`

Contains analytical metrics derived from the silver layer.

---

# SQL Transformations

## Silver Transformation

Parses and standardizes historical Bitcoin records.

## Gold Transformation

Creates analytical KPIs such as:

- close price  
- volume  
- market cap  
- price change  

---

# Cloud Run Logic

Cloud Run executes the transformation pipeline:

1. Reads data from `bronze.bitcoin_raw`
2. Creates `silver.bitcoin_prices`
3. Creates `gold.bitcoin_kpis`

---

# Scheduling

Cloud Scheduler triggers the Cloud Run service automatically **every day** to execute the pipeline.

---

## Project Structure
gcp-bitcoin-batch-pipeline
│
├── architecture
│ └── pipeline_architecture.png
│
├── cloud_run
│ ├── main.py
│ └── requirements.txt
│
├── sql
│ ├── silver_bitcoin_prices.sql
│ └── gold_bitcoin_kpis.sql
│
├── data
│ └── bitcoin_historical_data.csv
│
└── README.md

---

# Skills Demonstrated

- Batch data pipeline design  
- Google Cloud architecture  
- BigQuery data warehousing  
- Cloud Run serverless processing  
- Cloud Scheduler orchestration  
- SQL data transformations  
- Python for data engineering