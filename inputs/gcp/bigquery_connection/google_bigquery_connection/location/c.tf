
resource "google_bigquery_connection" "c" {
   connection_id = "my-connection"
   location      = "australia-southeast2"
   friendly_name = "compliant connection"
   description   = "a riveting description"
   project = "my project c"
   cloud_resource {}
}