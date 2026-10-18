resource "google_bigquery_table" "non_compliant_example_1" {
  project = "PDE"
  dataset_id = "non_compliant_example_1"
  table_id   = "your_table_id"

    encryption_configuration {
    kms_key_name = ""
  }
}
