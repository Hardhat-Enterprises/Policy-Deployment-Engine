resource "google_bigquery_connection" "c" {
  connection_id = "my-sql-connection"
  location      = "australia-southeast2"
  project       = "my-project-c"

  cloud_sql {
    instance_id = "my-project-c:australia-southeast2:sql-instance"
    database    = "appdb"
    type        = "POSTGRES"
    credential {
      username = "appuser"
      password = "sensitive-password"
    }
  }
}
