package terraform.gcp.security.scc.google_scc_event_threat_detection_custom_module.type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.event_threat_detection_custom_module.vars

conditions := [
  [
    {
      "situation_description": "Event Threat Detection module must use an approved type.",
      "remedies": [
        "Set type to one of the approved values: CONFIGURABLE_BAD_IP or CONFIGURABLE_BAD_DOMAIN"
      ]
    },
    {
      "condition": "Check type is approved",
      "attribute_path": ["type"],
      "values": ["CONFIGURABLE_BAD_IP", "CONFIGURABLE_BAD_DOMAIN"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
