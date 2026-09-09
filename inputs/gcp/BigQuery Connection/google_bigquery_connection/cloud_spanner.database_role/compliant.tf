resource "google_bigquery_connection" "compliant_example_1" {
  connection_id = "compliant_example_1"
  location      = "US"
  cloud_spanner {
    database      = "projects/fake-project/instances/fake-instance/databases/fake-db"
    database_role = "approved_readonly_role"
  }
}
