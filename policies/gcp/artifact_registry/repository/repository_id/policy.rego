package terraform.gcp.security.artifact_registry.repository.repository_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository.vars

conditions := [
  [
    {
      "situation_description": "Repository ID does not follow the required naming convention: only lowercase letters, numbers, and hyphens are allowed (e.g., `my-repo-1`).",
      "remedies": [
        "Rename the repository ID to match the format: lowercase letters, numbers, and hyphens only.",
        "Avoid using uppercase letters, spaces, underscores, or special characters."
      ]
    },
    {
      "condition": "Test if the repository_id matches the required naming pattern.",
      "attribute_path": ["repository_id"],
      "values": ["^[a-z0-9-]+$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
