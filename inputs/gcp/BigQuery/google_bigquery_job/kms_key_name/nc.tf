resource "google_bigquery_job" "nc" {
  job_id = "nc"
    project = "PDE"

  query {
    query = "SELECT 1"
      
    destination_encryption_configuration {
      kms_key_name = ""
    }
  }
}