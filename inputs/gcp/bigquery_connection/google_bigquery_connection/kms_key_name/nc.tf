resource "google_bigquery_connection" "nc" {
  project       = "my-project-nc"
  location      = "australia-southeast2"
  connection_id = "cmek-conn-nc"

  kms_key_name  = "projects/my-project-nc/locations/australia-southeast2/keyRings/kr/cryptoKeys/bq-key-au"

  cloud_resource {}
}
