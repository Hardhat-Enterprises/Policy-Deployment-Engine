resource "google_bigquery_job" "non_compliant_example_1" {
  job_id = "non_compliant_example_1"
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
