resource "google_bigquery_connection" "nc" {
   connection_id = "connection_id"
   location      = "US"
   friendly_name = "👋"
   description   = "a riveting description"
   kms_key_name  = ""
   cloud_resource {}
   project = "pde_pro"
}