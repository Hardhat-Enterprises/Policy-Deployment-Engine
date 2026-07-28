resource "google_beyondcorp_security_gateway_application" "compliant_example_1" {
  security_gateway_id = "default-sg"
  application_id      = "compliant_example_1"
  project             = "smooth-verve-467716-v1"

  endpoint_matchers {
    hostname = "svc.corp.example.com"
    ports    = [443]  
  }
}
