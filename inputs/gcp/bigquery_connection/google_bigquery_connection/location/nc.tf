
resource "google_bigquery_connection" "nc" {
   connection_id = "my-connection"
   location      = "US"
   friendly_name = "non compliant connection"
   description   = "a riveting description"
   project ="my project nc"
   cloud_resource {}
}