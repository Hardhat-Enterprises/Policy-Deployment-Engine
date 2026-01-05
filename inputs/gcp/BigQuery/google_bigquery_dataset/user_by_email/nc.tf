resource "google_bigquery_dataset" "nc" {
  dataset_id    = "nc"
  project       = "your-gcp-project-id" 
  friendly_name = "Example Dataset"
  description   = "A simple example dataset created with Terraform"
  location      = "australia-southeast1"

  access {
    role          = "VIEWER"
    user_by_email = "invalid@example.com"
  }

}
