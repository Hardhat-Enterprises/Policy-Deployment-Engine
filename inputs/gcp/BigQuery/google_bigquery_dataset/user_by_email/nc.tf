resource "google_bigquery_dataset" "nc" {
  dataset_id    = "nc"
  project       = "PDE" 
  location      = "australia-southeast1"

  access {
    role          = "VIEWER"
    user_by_email = "invalid@example.com"
  }

}
