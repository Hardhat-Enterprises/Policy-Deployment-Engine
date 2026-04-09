resource "google_scc_event_threat_detection_custom_module" "nc" {
  organization     = "123456789"
  display_name     = "nc"
  enablement_state = "DISABLED"
  type             = "CONFIGURABLE_BAD_IP"

  config = jsonencode({
    suspiciousLoginDetector = {
      enabled = false
    }
  })
}
