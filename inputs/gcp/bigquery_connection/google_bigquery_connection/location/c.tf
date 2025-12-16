resource "google_bigquery_connection" "c" {
   connection_id = "my-connection"
   location      = "AUSTRALIA-SOUTHEAST1"
   friendly_name = "👋"
   description   = "a riveting description"
   cloud_resource {}
   project = "pde_pro"
}