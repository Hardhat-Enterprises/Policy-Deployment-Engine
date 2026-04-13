resource "google_bigquery_table" "c" {
  project    = "PDE"
  dataset_id = "c"
  table_id   = "your_table_id"

  encryption_configuration {
    kms_key_name = "valid_kms_key_name"
  }
}