resource "google_bigquery_connection" "c" {
  connection_id = "my-connection"
  location      = "australia-southeast2"
  friendly_name = "compliant connection"
  description   = "example compliant"
  project       = "my project c"

  cloud_sql {
    instance_id = "my-project:australia-southeast1:pg-app"
    database    = "appdb_prod"   # compliant
    type        = "POSTGRES"

    credential {
      username = "bq_proxy_app"
      password = "REDACTED"
    }
  }
}
