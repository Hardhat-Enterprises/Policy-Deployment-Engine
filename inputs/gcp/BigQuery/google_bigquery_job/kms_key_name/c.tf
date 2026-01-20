resource "google_bigquery_job" "c" {
  job_id = "c"
  project = "PDE"

  query {
    query = "SELECT 1"
      
    destination_encryption_configuration {
      kms_key_name = "valid_key"
    }
  }
}