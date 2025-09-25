
resource "google_beyondcorp_app_connection" "nc" {
  name         = "nc"
  project      = "smooth-verve-467716-v1"
  type         = "TCP_PROXY"
  region       = "australia-southeast1"
  application_endpoint {
    host = "svc.internal-bad"
    port = 8081
  }
}
