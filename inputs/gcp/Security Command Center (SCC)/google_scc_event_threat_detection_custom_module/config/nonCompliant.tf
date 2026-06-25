resource "google_scc_event_threat_detection_custom_module" "non_compliant_example_1" {
  organization     = "123456789"
  display_name     = "non_compliant_example_1"
  enablement_state = "DISABLED"
  type             = "CONFIGURABLE_BAD_IP"

  config = jsonencode({
    suspiciousLoginDetector = {
      enabled = false
    }
  })
}
