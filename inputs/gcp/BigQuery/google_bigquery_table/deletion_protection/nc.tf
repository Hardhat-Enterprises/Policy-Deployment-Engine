resource "google_bigquery_table" "nc" {
  project = "PDE"
  dataset_id = "nc"
  table_id   = "your_table_id"
  deletion_protection = false
}