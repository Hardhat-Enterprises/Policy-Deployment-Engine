resource "google_scc_event_threat_detection_custom_module" "c" {
  organization     = "123456789"
  display_name     = "c"
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
