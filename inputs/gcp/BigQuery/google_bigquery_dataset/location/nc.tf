resource "google_bigquery_dataset" "nc" {
  dataset_id = "nc"
  project    = "PDE"
  location   = "global"

}
