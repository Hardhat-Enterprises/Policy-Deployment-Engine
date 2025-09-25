
resource "google_beyondcorp_security_gateway_application" "nc" {
  security_gateway_id = "nc"
  project = "smooth-verve-467716-v1"
  application_id = "nc"
  endpoint_matchers {
    hostname = "web.external.net"
    ports = [22, 8080]
  }
}
