resource "google_scc_event_threat_detection_custom_module" "compliant_example_1" {
  display_name     = "compliant_example_1"
  type             = "CONFIGURABLE_BAD_IP"
  organization     = "123456789"

  config = jsonencode({
    "metadata": {
      "severity": "LOW",
      "description": "Flagged by Forcepoint as malicious",
      "recommendation": "Contact the owner of the relevant project."
    },
    "ips": [
      "192.0.2.1",
      "192.0.2.0/24"
    ]
  })

  enablement_state = "ENABLED"
}
