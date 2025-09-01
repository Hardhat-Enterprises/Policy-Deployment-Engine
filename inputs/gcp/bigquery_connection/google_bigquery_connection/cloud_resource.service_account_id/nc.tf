resource "google_bigquery_connection" "nc" {
  project       = "my-project nc"
  location      = "australia-southeast1"
  connection_id = "cloud-resource-conn-nc"

  cloud_resource {}  # leave empty; service_account_id is computed
}
