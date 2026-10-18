resource "google_bigquery_connection" "non_compliant_example_1" {
  connection_id = "non_compliant_example_1"
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
          plaintext = ""
        }
      }
    }
  }
}
