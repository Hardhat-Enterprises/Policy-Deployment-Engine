resource "google_bigquery_connection" "nc" {
   connection_id = "my-connection"
   location      = "AUSTRALIA-SOUTHEAST1"
   friendly_name = "👋"
   description   = "a riveting description"
   kms_key_name  = "projects/project-id/locations/us-west/keyRings/bq-keyring/cryptoKeys/bq-ke"
   cloud_resource {}
   project = "pde_pro"
}