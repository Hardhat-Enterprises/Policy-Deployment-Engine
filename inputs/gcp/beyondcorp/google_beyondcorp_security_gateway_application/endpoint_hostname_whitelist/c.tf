resource "google_beyondcorp_security_gateway_application" "c" {
  security_gateway_id = "c-default-sg"
  application_id = "app-web-01"
  endpoint_matchers {
    hostname = "web.corp.example.com"
    ports = [443 , 8443]
  }
}
