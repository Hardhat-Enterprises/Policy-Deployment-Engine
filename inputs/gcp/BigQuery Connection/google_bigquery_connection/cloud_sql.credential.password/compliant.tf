resource "google_bigquery_connection" "compliant_example_1" {
  connection_id = "compliant_example_1"
  location      = "US"
  cloud_sql {
    instance_id = "fake-project:us-central1:fake-instance"
    database    = "fake-db"
    type        = "POSTGRES"
    credential {
      username = "fake-user"
      password = "non-empty-placeholder-password"
    }
  }
}
