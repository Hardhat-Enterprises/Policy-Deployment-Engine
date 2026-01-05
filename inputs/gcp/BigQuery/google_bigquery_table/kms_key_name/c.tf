resource "google_bigquery_table" "c" {
  project = "example-project"
  dataset_id = "c"
  table_id   = "your_table_id"

  encryption_configuration {
    kms_key_name = "valid_kms_key_name"
  }
}