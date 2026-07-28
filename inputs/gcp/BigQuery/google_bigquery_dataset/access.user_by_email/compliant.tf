resource "google_bigquery_dataset" "compliant_example_1" {
  dataset_id    = "compliant_example_1"
  project       = "PDE" 
  location      = "australia-southeast1"

  access {
    role          = "OWNER"
    user_by_email = "admin@example.com"
  }
}
