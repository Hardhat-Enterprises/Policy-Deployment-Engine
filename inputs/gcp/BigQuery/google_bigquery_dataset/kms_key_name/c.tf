resource "google_bigquery_dataset" "c" {
  dataset_id    = "c"
  project       = "your-gcp-project-id" 
  friendly_name = "Example Dataset"
  description   = "A simple example dataset created with Terraform"
  location      = "australia-southeast1"

  default_encryption_configuration {
    kms_key_name = "google_kms_crypto_key.crypto_key.id"
  }
}