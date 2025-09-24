resource "google_bigquery_connection" "c" {
  project       = "my-project-c"
  location      = "australia-southeast2"
  connection_id = "cmek-conn-c"

  kms_key_name  = "projects/my-project-c/locations/australia-southeast1/keyRings/kr/cryptoKeys/bq-key-au"

  cloud_resource {}
}
