resource "google_bigquery_job" "c" {
  job_id   = "c"
  project  = "PDE"
  location = "australia-southeast1"

  query {
    query = "SELECT 1"

    connection_properties {
      key   = "service_account_id"
      value = "valid_value"

    }
  }


}
