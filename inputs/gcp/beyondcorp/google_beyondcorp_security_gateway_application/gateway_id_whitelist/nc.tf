resource "google_beyondcorp_security_gateway_application" "nc" {
  security_gateway_id = "custom-sg-dev"
  application_id      = "nc"
  project             = "smooth-verve-467716-v1"

  endpoint_matchers {
    hostname = "svc.corp.example.com"
    ports    = [443]
  }
}
