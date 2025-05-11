package terraform.gcp.security.artifact_registry.repository.description

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository.vars

conditions := [
  {
    "situation_description": "The repository does not have a description.",
    "remedies": [
      "Add a description that explains the purpose of the repository."
    ]
  },
  {
    "condition": "Check if description is missing or null.",
    "attribute_path": ["description"],
    "values": [null],
    "policy_type": "blacklist"
  }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
