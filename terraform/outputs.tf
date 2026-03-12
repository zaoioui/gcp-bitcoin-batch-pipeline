output "bucket_name" {
  value = google_storage_bucket.data_lake.name
}

output "bronze_dataset" {
  value = google_bigquery_dataset.bronze.dataset_id
}

output "silver_dataset" {
  value = google_bigquery_dataset.silver.dataset_id
}

output "gold_dataset" {
  value = google_bigquery_dataset.gold.dataset_id
}