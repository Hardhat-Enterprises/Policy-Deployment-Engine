resource "google_bigquery_connection" "nc" {
  connection_id = "noncompliant-sql-conn"
  location      = "australia-southeast2"
  project       = "my-project-nc"

  cloud_sql {
    instance_id = "my-project-nc:australia-southeast2:sql-instance"
    database    = "db"
    type        = "POSTGRES"
    credential {
      username = "admin"
      password = "sensitive-password"
    }
  }
}
