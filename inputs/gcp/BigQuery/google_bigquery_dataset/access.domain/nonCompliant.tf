resource "google_bigquery_dataset" "non_compliant_example_1" {
  dataset_id    = "non_compliant_example_1"
  project       = "PDE" 
  location      = "australia-southeast1"
access {
  role   = "READER"
  domain = "invalid.com"
  }
}
