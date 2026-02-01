resource "google_bigquery_dataset" "c" {
  dataset_id    = "c"
  project       = "PDE" 
  location      = "australia-southeast1"

access {
  role   = "READER"
  domain = "example.com"
  }

}