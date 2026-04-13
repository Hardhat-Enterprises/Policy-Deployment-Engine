resource "google_bigquery_table" "nc" {
  project    = "PDE"
  dataset_id = "nc"
  table_id   = "your_table_id"
  external_data_configuration {
    autodetect    = true
    connection_id = ""
    source_uris   = ["gs://your-bucket/your-data/*.csv"]
  }

}