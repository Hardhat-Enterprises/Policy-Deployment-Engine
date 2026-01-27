# Non-compliant example for network configuration policy

resource "google_biglake_catalog" "nc" {
  resource_name = "biglake-network-non-compliant"
  description   = "Non-compliant network configuration"

  network_configuration {
    allowed_ip_ranges = ["0.0.0.0/0"]
  }
}
