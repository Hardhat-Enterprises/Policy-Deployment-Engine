resource "google_bigquery_connection" "compliant_example_1" {
  connection_id   = "compliant_example_1"
  location        = "US"
  deletion_policy = "PREVENT"
  cloud_resource {}
}
