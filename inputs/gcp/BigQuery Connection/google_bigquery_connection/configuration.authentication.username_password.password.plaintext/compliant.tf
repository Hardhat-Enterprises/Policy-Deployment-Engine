resource "google_bigquery_connection" "compliant_example_1" {
  connection_id = "compliant_example_1"
  location      = "US"
  configuration {
    connector_id = "google-cloudsql-postgres"
    asset {
      database = "fake-db"
    }
    authentication {
      username_password {
        username = "fake-user"
        password {
          plaintext = "non-empty-placeholder-password"
        }
      }
    }
  }
}
