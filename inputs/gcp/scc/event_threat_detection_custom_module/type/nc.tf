resource "google_scc_event_threat_detection_custom_module" "nc" {
  organization     = "organizations/123456789"
  display_name     = "nc"
  enablement_state = "ENABLED"
  type             = "INVALID_TYPE"

  config = jsonencode({
    allowed_ips = ["192.168.1.1", "10.0.0.1"]
  })
}
