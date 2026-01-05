resource "google_bigquery_table" "nc" {
  project = "example-project"
  dataset_id = "nc"
  table_id   = "your_table_id"
  require_partition_filter = false
}