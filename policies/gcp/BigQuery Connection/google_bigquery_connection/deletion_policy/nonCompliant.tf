resource "google_bigquery_connection" "non_compliant_example_1" {
  connection_id   = "non_compliant_example_1"
  location        = "US"
  deletion_policy = "DELETE"
  cloud_resource {}
}
