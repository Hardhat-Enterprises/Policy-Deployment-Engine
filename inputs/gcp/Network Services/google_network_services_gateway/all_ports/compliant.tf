resource "google_network_services_gateway" "compliant_example_1" {
  
  name     = "compliant-gateway"
  location = "global"
  type     = "SECURE_WEB_GATEWAY"

  all_ports = false
}