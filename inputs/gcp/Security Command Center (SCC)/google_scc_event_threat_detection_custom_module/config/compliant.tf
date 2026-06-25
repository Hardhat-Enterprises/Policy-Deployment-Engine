resource "google_scc_event_threat_detection_custom_module" "compliant_example_1" {
  organization     = "123456789"
  display_name     = "compliant_example_1"
  enablement_state = "ENABLED"
  type             = "CONFIGURABLE_BAD_IP" 

  config = jsonencode({
    suspiciousLoginDetector = {
      enabled    = true
      threshold  = 5
      timeWindow = "10m"
    }
  })
}
