resource "google_bigquery_dataset" "nc" {
  dataset_id    = "nc"
  project       = "your-gcp-project-id" 
  friendly_name = "Example Dataset"
  description   = "A simple example dataset created with Terraform"
  location      = "global"

}
