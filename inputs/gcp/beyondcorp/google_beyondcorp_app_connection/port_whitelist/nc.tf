resource "google_beyondcorp_app_connection" "nc" {
  name         = "nc-port-bad"
  type         = "TCP_PROXY"
  region       = "australia-southeast1"
  application_endpoint {
    host = "svc.internal"
    port = 8081
  }
}
