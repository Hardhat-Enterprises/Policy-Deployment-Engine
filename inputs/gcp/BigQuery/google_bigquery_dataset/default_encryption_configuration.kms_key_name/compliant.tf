resource "google_bigquery_dataset" "compliant_example_1" {
  dataset_id    = "compliant_example_1"
  project       = "PDE" 
  location      = "australia-southeast1"

  default_encryption_configuration {
    kms_key_name = "google_kms_crypto_key.crypto_key.id"
  }
}
