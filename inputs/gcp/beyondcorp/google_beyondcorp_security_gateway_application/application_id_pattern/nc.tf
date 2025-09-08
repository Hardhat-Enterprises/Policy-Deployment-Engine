resource "google_beyondcorp_security_gateway_application" "nc" {
  security_gateway_id = "default-sg"
  application_id = "1_BAD!"
  endpoint_matchers { 
    hostname = "api.corp.example.com"
  }
}
