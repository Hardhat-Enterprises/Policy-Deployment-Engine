resource "google_bigquery_connection" "non_compliant_example_1" {
  connection_id = "non_compliant_example_1"
  location      = "US"
  cloud_spanner {
    database      = "projects/fake-project/instances/fake-instance/databases/fake-db"
    database_role = "untrusted_admin_role"
  }
}
