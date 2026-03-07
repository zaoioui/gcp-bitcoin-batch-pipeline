from google.cloud import bigquery

PROJECT_ID = "finance-data-pipeline-489121"

def main(request):

    client = bigquery.Client(project=PROJECT_ID)

    sql_silver = """
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
    FROM `finance-data-pipeline-489121.bronze.bitcoin_raw`
    """

    sql_gold = """
    CREATE OR REPLACE TABLE `finance-data-pipeline-489121.gold.bitcoin_kpis` AS
    SELECT
      trade_date,
      close,
      volume,
      market_cap,
      close - LAG(close) OVER(ORDER BY trade_date) AS price_change
    FROM `finance-data-pipeline-489121.silver.bitcoin_prices`
    """

    client.query(sql_silver).result()
    client.query(sql_gold).result()

    return "Pipeline executed successfully"