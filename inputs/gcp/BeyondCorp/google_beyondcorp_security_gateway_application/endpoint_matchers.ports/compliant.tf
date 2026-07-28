resource "google_beyondcorp_security_gateway_application" "compliant_example_1" {
  security_gateway_id = "c"
  project = "smooth-verve-467716-v1"
  application_id = "compliant_example_1"
  endpoint_matchers {
    hostname = "web.corp.example.com"
    ports = [443 , 8443]
  }
}
