resource "google_bigquery_table" "non_compliant_example_1" {
  project = "PDE"
  dataset_id = "non_compliant_example_1"
  table_id   = "your_table_id"
  external_data_configuration {
  autodetect = true
  connection_id = ""
  source_uris   = ["gs://your-bucket/your-data/*.csv"]
}

}
