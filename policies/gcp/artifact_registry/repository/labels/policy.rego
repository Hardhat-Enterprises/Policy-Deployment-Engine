package terraform.gcp.security.artifact_registry.repository.labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository.vars

conditions := [
  {
    "situation_description": "The repository does not include any labels.",
    "remedies": [
      "Add at least one label for resource classification (e.g., environment, team)."
    ]
  },
  {
    "condition": "Check if labels are missing or null.",
    "attribute_path": ["labels"],
    "values": [null, {}],
    "policy_type": "blacklist"
  }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
