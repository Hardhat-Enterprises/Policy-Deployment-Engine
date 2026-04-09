resource "google_bigquery_job" "nc" {
  job_id = "nc"
  project = "PDE"
  location = "global"
  query {
    query = "SELECT 1"

    connection_properties {
      key   = ""
      value = "your_value_here"
    }
  }
}