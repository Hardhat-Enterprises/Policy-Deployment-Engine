resource "google_compute_security_policy" "compliant_example_1" {
  name = "compliant-example-1"

  adaptive_protection_config {
    layer_7_ddos_defense_config {
      enable = true
    }
  }
}