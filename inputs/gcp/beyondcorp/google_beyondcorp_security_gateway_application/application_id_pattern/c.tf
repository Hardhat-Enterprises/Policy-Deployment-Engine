resource "google_beyondcorp_security_gateway_application" "c" {
  security_gateway_id = "default-sg"
  application_id = "app-payments-01"
  endpoint_matchers {
    hostname = "api.corp.example.com"
  }
}
