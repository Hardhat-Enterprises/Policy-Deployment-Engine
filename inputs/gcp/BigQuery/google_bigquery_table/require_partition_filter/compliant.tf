resource "google_bigquery_table" "compliant_example_1" {
  project = "PDE"
  dataset_id = "compliant_example_1"
  table_id   = "your_table_id"
  require_partition_filter = true
}
