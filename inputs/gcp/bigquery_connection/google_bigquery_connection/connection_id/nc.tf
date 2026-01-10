resource "google_bigquery_connection" "nc" {
   location      = "AUSTRALIA-SOUTHEAST1"
   friendly_name = "👋"
   description   = "a riveting description"
   cloud_resource {}
   project = "pde_pro"
}