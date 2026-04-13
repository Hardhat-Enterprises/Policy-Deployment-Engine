resource "google_bigquery_dataset" "nc" {
  dataset_id = "nc"
  project    = "PDE"
  location   = "australia-southeast1"

  default_encryption_configuration {
    kms_key_name = ""
  }
}