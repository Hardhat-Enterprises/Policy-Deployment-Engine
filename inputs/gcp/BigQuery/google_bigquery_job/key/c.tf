resource "google_bigquery_job" "c" {
  job_id   = "c"
  project  = "PDE"
  location = "australia-southeast1"

  query {
    query = "SELECT 1"

    connection_properties {
      key   = "valid_key"
      value = "your_value_here"
    }
  }
}