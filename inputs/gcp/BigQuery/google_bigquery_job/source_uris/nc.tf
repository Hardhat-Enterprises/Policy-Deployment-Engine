resource "google_bigquery_job" "nc" {
  job_id   = "nc"
  project  = "PDE"
  location = "global"
  load {
    source_uris = ["invalid_uri"]

    destination_table {
      dataset_id = "your_dataset"
      table_id   = "your_table"
    }

  }
}