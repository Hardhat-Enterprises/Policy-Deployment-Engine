resource "google_network_services_gateway" "non_compliant_example_1" {
  name     = "noncompliant-gateway"
  location = "global"
  type     = "SECURE_WEB_GATEWAY"
}