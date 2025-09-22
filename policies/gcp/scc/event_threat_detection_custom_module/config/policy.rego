package terraform.gcp.security.scc.google_scc_event_threat_detection_custom_module.config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.event_threat_detection_custom_module.vars

conditions := [
  [
    {
      "situation_description": "Config must match the approved whitelist.",
      "remedies": [
        "Update the config block to include only approved values"
      ]
    },
    {
      "condition": "Check config is in the approved whitelist",
      "attribute_path": ["config"],
      "values": [
        {"allowed_ips": ["192.168.1.1", "10.0.0.1"]}
      ],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
