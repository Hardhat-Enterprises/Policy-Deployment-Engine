resource "google_bigquery_job" "nc" {
  job_id = "nc"
  project = "your-gcp-project-id"
  location = "global"
  query {
    query = "SELECT 1"
      
    destination_encryption_configuration {
      kms_key_name = "valid_key"
    }
  }
}