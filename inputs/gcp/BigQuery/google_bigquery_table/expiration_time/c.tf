resource "google_bigquery_table" "c" {
  project = "PDE"
  dataset_id = "c"
  table_id   = "your_table_id"
  expiration_time = "1625097600000"
}