resource "google_beyondcorp_app_connection" "c" {
  name = "c"
  type = "TCP_PROXY"
  region = "australia-southeast1"
  display_name = "region good"
  application_endpoint {
    host = "svc.internal"
    port = 443
  }
}
