package terraform.gcp.security.privileged_access_manager.entitlement.max_request_duration

import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
  [
    {
      "situation_description": "Privileged Access max_request_duration must not exceed 1 hour (3600s)",
      "remedies": ["Set max_request_duration to 3600s (1 hour) or less"]
    },
    {
      "condition": "Check if max_request_duration exceeds 3600 seconds",
      "attribute_path": ["max_request_duration"],
      "values": ["3600s"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details