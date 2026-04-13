resource "google_beyondcorp_security_gateway_application" "c" {
  security_gateway_id = "default-sg"
<<<<<<< HEAD
  application_id      = "gateway-app-c"
=======
  application_id      = "c"
>>>>>>> origin/dev
  project             = "smooth-verve-467716-v1"

  endpoint_matchers {
    hostname = "svc.corp.example.com"
    ports    = [443]  
  }
}
