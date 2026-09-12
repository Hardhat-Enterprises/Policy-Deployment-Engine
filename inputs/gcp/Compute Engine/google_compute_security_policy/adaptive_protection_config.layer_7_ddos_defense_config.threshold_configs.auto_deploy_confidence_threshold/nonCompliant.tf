resource "google_compute_security_policy" "non_compliant_example_1" {
  name = "non-compliant-example-1"

  adaptive_protection_config {
    layer_7_ddos_defense_config {
      enable = true
      threshold_configs {
        name                             = "non-compliant-threshold"
        auto_deploy_confidence_threshold = 0.99
      }
    }
  }
}