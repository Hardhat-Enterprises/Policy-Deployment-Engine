resource "google_bigquery_connection" "nc" {
  connection_id = "noncompliant-conn"
  location      = "US"
  kms_key_name  = "projects/my-project-nc/locations/US/keyRings/US/cryptoKeys/bq-key"
  project       = "my-project-nc"
  cloud_resource {}
}
