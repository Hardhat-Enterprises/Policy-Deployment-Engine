resource "google_beyondcorp_security_gateway_application" "non_compliant_example_1" {
  security_gateway_id = "c"
  project = "smooth-verve-467716-v1"
  application_id = "non_compliant_example_1"
  endpoint_matchers {
    hostname = "web.external.net"
    ports = [22, 8080]
  }
}
