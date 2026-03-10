resource "google_storage_bucket" "data_lake" {
  name     = "finance-data-lake-tf"
  location = "US"

  uniform_bucket_level_access = true
}

resource "google_bigquery_dataset" "bronze" {
  dataset_id = "bronze_tf"
  location   = "US"
}

resource "google_bigquery_dataset" "silver" {
  dataset_id = "silver_tf"
  location   = "US"
}

resource "google_bigquery_dataset" "gold" {
  dataset_id = "gold_tf"
  location   = "US"
}