resource "google_bigquery_connection" "non_compliant_example_1" {
  connection_id = "non_compliant_example_1"
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
