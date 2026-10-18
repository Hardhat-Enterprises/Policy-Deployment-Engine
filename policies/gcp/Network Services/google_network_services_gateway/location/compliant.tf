resource "google_network_services_gateway" "compliant_example_1" {
  name     = "compliant-gateway"
  location = "australia-southeast1"
  type     = "SECURE_WEB_GATEWAY"
}