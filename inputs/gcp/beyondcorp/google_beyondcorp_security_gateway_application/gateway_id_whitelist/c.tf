resource "google_beyondcorp_security_gateway_application" "c" {
  security_gateway_id = "default-sg"
  application_id      = "c"
  project             = "smooth-verve-467716-v1"

  endpoint_matchers {
    hostname = "svc.corp.example.com"
    ports    = [443]  
  }
}
