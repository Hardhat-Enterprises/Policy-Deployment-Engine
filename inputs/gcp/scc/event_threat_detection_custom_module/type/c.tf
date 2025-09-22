resource "google_scc_event_threat_detection_custom_module" "c" {
  organization     = "organizations/123456789"
  display_name     = "c"
  enablement_state = "ENABLED"
  type             = "CONFIGURABLE_BAD_IP"

  config = jsonencode({
    allowed_ips = ["192.168.1.1", "10.0.0.1"]
  })
}
