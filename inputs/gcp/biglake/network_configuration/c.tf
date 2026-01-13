# Compliant example for network configuration policy

resource "google_biglake_service" "c" {
  resource_name = "biglake-network-compliant"
  description   = "Compliant network configuration"

  network_configuration {
    allowed_ip_ranges = ["10.0.0.0/24", "192.168.0.0/16"]
  }
}
