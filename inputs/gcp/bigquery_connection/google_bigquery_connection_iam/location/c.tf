resource "google_bigquery_connection" "connection" {
   connection_id = "my-connection"
   location      = "US"
   friendly_name = "👋"
   description   = "a riveting description"
   cloud_resource {}
   project = "pde"
}