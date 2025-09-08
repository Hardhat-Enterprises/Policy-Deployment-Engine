resource "google_beyondcorp_app_connection" "nc" {
  name         = "nc-type-bad"
  type         = "TYPE_UNSPECIFIED" 
  region       = "australia-southeast1"
  display_name = "bad type"
  application_endpoint {
    host = "svc.internal"
    port = 443
  }
}
