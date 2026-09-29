resource "google_network_management_connectivity_test" "compliant_example_1" {
  name     = "compliant_example_1"
  protocol = "TCP"

  source {
    ip_address = "10.0.0.1"
  }

  destination {
    ip_address = "10.0.0.2"
    port       = 80
  }

  bypass_firewall_checks = false
}
