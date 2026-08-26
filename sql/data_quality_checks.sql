-- Contrôle des valeurs NULL
-- Vérifie les champs essentiels de la table Silver

SELECT
  COUNT(*) AS total_rows,
  COUNTIF(trade_date IS NULL) AS null_trade_date,
  COUNTIF(close IS NULL) AS null_close,
  COUNTIF(volume IS NULL) AS null_volume,
  COUNTIF(market_cap IS NULL) AS null_market_cap
FROM `finance-data-pipeline-489121.silver.bitcoin_prices`;

-- Contrôle des doublons sur la date de transaction

SELECT
  trade_date,
  COUNT(*) AS occurrence_count
FROM `finance-data-pipeline-489121.silver.bitcoin_prices`
GROUP BY trade_date
HAVING COUNT(*) > 1;

-- Contrôle des valeurs négatives

SELECT
  COUNTIF(close < 0) AS negative_close,
  COUNTIF(volume < 0) AS negative_volume,
  COUNTIF(market_cap < 0) AS negative_market_cap
FROM `finance-data-pipeline-489121.silver.bitcoin_prices`;

-- Vérification de la période couverte par les données

SELECT
  MIN(trade_date) AS min_date,
  MAX(trade_date) AS max_date,
  COUNT(DISTINCT trade_date) AS number_of_days
FROM `finance-data-pipeline-489121.silver.bitcoin_prices`;

-- Comparaison du volume de données entre Bronze et Silver

SELECT
  (SELECT COUNT(*)
   FROM `finance-data-pipeline-489121.bronze.bitcoin_raw`) AS bronze_rows,

  (SELECT COUNT(*)
   FROM `finance-data-pipeline-489121.silver.bitcoin_prices`) AS silver_rows;

   -- Contrôle du calcul de price_change