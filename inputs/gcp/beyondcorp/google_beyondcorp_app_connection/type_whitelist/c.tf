resource "google_beyondcorp_app_connection" "c" {
  name = "c-type-ok"
  type = "TCP_PROXY"
  region = "australia-southeast1"
  display_name = "Type is ok"
  application_endpoint {
    host = "svc.internal"
    port = 443
  }
}
