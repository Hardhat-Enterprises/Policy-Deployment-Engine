resource "google_bigquery_connection" "c" {
   connection_id = "my-connection"
   location      = "AUSTRALIA-SOUTHEAST1"
   friendly_name = "👋"
   description   = "a riveting description"
   kms_key_name  = "projects/project-id/locations/australia-southeast1/keyRings/bq-keyring/cryptoKeys/bq-key"
   cloud_resource {}
   project = "pde_pro"
}