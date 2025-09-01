resource "google_bigquery_connection" "nc" {
  connection_id = "my-connection"
  location      = "australia-southeast2"
  friendly_name = "non compliant connection"
  description   = "example non-compliant"
  project       = "my project nc"

  cloud_sql {
    instance_id = "my-project:australia-southeast1:pg-app"
    database    = "postgres"     # non-compliant
    type        = "POSTGRES"

    credential {
      username = "bq_proxy_app"
      password = "REDACTED"
    }
  }
}
