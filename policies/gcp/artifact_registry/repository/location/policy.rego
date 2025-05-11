package terraform.gcp.security.artifact_registry.repository.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository.vars

conditions := [
  {
    "situation_description": "The repository is located in a disallowed or insecure region.",
    "remedies": [
      "Change the location to an approved region as 'AU'."
    ]
  },
  {
    "condition": "Check if location is in the allowed list (AU only).",
    "attribute_path": ["location"],
    "values": ["AU"],
    "policy_type": "whitelist"
  }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
