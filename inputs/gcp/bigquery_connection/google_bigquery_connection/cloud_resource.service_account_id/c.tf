resource "google_bigquery_connection" "c" {
  project       = "my-project c"
  location      = "australia-southeast1"
  connection_id = "cloud-resource-conn-c"

  cloud_resource {}  # leave empty; service_account_id is computed
}
