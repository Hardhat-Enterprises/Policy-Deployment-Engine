resource "google_bigquery_table" "c" {
  project = "example-project"
  dataset_id = "c"
  table_id   = "your_table_id"
  deletion_protection = true
}