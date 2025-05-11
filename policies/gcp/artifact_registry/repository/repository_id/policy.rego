package terraform.gcp.security.artifact_registry.repository.repository_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository.vars

conditions := [
  {
    "situation_description": "Repository ID does not follow the naming convention (lowercase, hyphens, no spaces).",
    "remedies": [
      "Rename repository to match pattern: ^[a-z0-9-]+$"
    ]
  },
  {
    "condition": "Check if repository_id matches naming pattern.",
    "attribute_path": ["repository_id"],
    "values": ["^[a-z0-9-]+$"],
    "policy_type": "pattern whitelist"
  }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
