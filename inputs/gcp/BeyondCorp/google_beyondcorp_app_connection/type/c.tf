resource "google_beyondcorp_app_connection" "c" {
  name    = "c"
  project = "smooth-verve-467716-v1"
  type    = "TCP_PROXY"
  region  = "australia-southeast1"

  application_endpoint {
    host = "svc.internal"
    port = 443
  }
}
