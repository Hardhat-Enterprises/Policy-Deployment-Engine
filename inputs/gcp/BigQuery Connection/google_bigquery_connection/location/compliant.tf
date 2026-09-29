resource "google_bigquery_connection" "compliant_example_1" {
  connection_id = "compliant_example_1"
  location      = "US"
  cloud_resource {}
}
