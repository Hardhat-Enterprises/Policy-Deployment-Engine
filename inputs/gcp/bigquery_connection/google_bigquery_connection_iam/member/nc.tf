resource "google_bigquery_connection" "nc" {
   connection_id = ""
   location      = "US"
   friendly_name = "👋"
   description   = "a riveting description"
   cloud_resource {}
   project = "pde_pro"
}