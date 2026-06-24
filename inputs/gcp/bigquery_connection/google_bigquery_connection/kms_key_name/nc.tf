resource "google_bigquery_connection" "nc" {
  connection_id = "nc"
  project       = "PDE"
  location      = "australia-southeast1"

  cloud_sql {
    instance_id = "project:region:instance"
    database    = "mydatabase"
    type        = "POSTGRES"
    credential {
      username = "admin"
      password = "securepassword123"
    }
  }
}
