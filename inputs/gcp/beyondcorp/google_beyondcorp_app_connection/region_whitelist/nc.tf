resource "google_beyondcorp_app_connection" "nc" {
  name = "nc"
  type = "TCP_PROXY"
  region = "us-central1"
  display_name = "bad region"
  application_endpoint {
    host = "svc.internal"
    port = 443
  }
}
