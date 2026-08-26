-- Silver → Gold
-- Création des KPI analytiques
-- price_change = variation du prix de clôture par rapport au jour précédent
CREATE OR REPLACE TABLE `finance-data-pipeline-489121.gold.bitcoin_kpis` AS
SELECT
  trade_date,
  close,
  volume,
  market_cap,
  close - LAG(close) OVER(ORDER BY trade_date) AS price_change
FROM `finance-data-pipeline-489121.silver.bitcoin_prices`;