resource "google_beyondcorp_security_gateway_application" "nc" {
  security_gateway_id = "nc-default-sg"
  application_id = "app-web-01"
  endpoint_matchers {
    hostname = "web.external.net"
    ports = [22, 8080]
  }
}
