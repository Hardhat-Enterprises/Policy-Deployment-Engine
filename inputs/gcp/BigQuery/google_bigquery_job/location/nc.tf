resource "google_bigquery_job" "nc" {
  job_id   = "nc"
  project  = "PDE"
  location = "global"
  query {
    query = "SELECT 1"

    destination_encryption_configuration {
      kms_key_name = "valid_key"
    }
  }
}