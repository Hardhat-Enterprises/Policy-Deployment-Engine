resource "google_bigquery_connection" "nc" {
  connection_id = "conn-nc"
  location      = "australia-southeast2"
  friendly_name = "non-compliant connection"
  description   = "cloud_sql.password policy – non-compliant"
  project       = "my project nc"

  cloud_sql {
    instance_id = "my-project:australia-southeast1:pg-app"
    database    = "appdb_prod"
    type        = "POSTGRES"

    credential {
      username = "root"          
      password = "REDACTED"
    }
  }
}
