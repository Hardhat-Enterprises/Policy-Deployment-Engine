resource "google_bigquery_dataset" "c" {
  dataset_id    = "c"
  project       = "your-gcp-project-id" 
  friendly_name = "Example Dataset"
  description   = "A simple example dataset created with Terraform"
  location      = "australia-southeast1"

  access {
    role          = "OWNER"
    user_by_email = "admin@example.com"
  }
}