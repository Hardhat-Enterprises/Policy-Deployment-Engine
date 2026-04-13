resource "google_bigquery_dataset_access" "nc" {
  dataset_id    = "nc"
  project       = "PDE"
  role          = "VIEWER"
  user_by_email = "invalid@gmail.com"
}