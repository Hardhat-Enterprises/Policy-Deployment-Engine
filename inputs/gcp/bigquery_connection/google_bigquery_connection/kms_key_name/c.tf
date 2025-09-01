resource "google_bigquery_connection" "c" {
  connection_id = "my-connection"
  location      = "australia-southeast2"
  kms_key_name  = "projects/my-project-c/locations/australia-southeast2/keyRings/australia-southeast2/cryptoKeys/bq-key"
  project       = "my-project-c"
  cloud_resource {}
}