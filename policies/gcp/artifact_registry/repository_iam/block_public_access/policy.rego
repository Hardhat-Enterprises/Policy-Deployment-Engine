package terraform.gcp.security.artifact_registry.repository_iam.block_public_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository_iam.vars

conditions := [
  {
    "situation_description": "IAM member is publicly accessible via allUsers or allAuthenticatedUsers.",
    "remedies": [
      "Avoid assigning roles to allUsers or allAuthenticatedUsers. Use specific service accounts or user groups."
    ]
  },
  {
    "condition": "Block public IAM members.",
    "attribute_path": ["member"],
    "values": ["allUsers", "allAuthenticatedUsers"],
    "policy_type": "blacklist"
  }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
