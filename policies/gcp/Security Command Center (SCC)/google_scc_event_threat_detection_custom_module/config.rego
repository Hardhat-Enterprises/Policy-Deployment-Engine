package terraform.gcp.security.scc.google_scc_event_threat_detection_custom_module.config

import data.terraform.helpers
import data.terraform.gcp.security.scc.google_scc_event_threat_detection_custom_module.vars

conditions := [
  [
    {
      "situation_description": "Suspicious login detection must be enabled in Event Threat Detection custom module.",
      "remedies": [
        "Ensure suspiciousLoginDetector.enabled is set to true with proper threshold and timeWindow."
      ]
    },
    {
      "condition": "Config must match the secure JSON settings",
      "attribute_path": ["config"],
      "values": ["{\"suspiciousLoginDetector\":{\"enabled\":true,\"threshold\":5,\"timeWindow\":\"10m\"}}"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
