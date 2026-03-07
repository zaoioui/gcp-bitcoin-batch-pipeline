CREATE OR REPLACE TABLE `finance-data-pipeline-489121.silver.bitcoin_prices` AS
SELECT
  PARSE_DATE('%b-%d-%Y', date) AS trade_date,
  open,
  high,
  low,
  close,
  volume,
  market_cap,
  ma20,
  ma50,
  ma200,
  rsi14
FROM `finance-data-pipeline-489121.bronze.bitcoin_raw`;