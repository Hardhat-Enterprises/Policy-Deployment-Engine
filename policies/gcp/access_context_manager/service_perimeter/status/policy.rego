package terraform.gcp.security.access_manager.service_perimeter.status

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.service_perimeter.status.vars

conditions := [
  [
    {"situation_description": "No restricted services are defined in perimeter status",
     "remedies": ["Add at least one restricted service to enforce perimeter"]},
    {
      "condition": "Check that restricted_services is not empty",
      "attribute_path": ["status", "restricted_services"],
      "values": [1, null],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details