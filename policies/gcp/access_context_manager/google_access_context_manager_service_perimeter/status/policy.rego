package terraform.gcp.security.access_manager.google_access_context_manager_service_perimeter.status

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.google_access_context_manager_service_perimeter.status.vars

conditions := [
  [
    {
      "situation_description": "No restricted services are defined in perimeter status.",
      "remedies": ["Add at least one restricted service to enforce the perimeter."]
    },
    {
      "condition": "Check that restricted_services is not empty.",
      "attribute_path": ["status", 0, "restricted_services"],
      "values": [1],
      "policy_type": "min_length"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
