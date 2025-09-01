resource "google_bigquery_connection" "nc" {
  connection_id = "noncompliant-sql-conn"
  location      = "us"
  project       = "my-project-nc"

  cloud_sql {

    instance_id = "my-project-nc:us-central1:sql-instance"

    database    = "db"

    type        = "DATABASE_TYPE_UNSPECIFIED"

    credential {
      username = "appuser"
      password = "sensitive-password"
    }
  }
}
