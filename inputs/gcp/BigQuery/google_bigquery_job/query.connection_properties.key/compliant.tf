resource "google_bigquery_job" "compliant_example_1" {
  job_id   = "compliant_example_1"
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
