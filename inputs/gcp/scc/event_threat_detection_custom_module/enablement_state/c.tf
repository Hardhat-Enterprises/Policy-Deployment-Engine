# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_scc_event_threat_detection_custom_module" "c" {
    display_name= "enablement_state"
    type = "CONFIGURABLE_BAD_IP"
    organization = "123456789"
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
