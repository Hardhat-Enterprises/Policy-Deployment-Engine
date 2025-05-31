package terraform.gcp.security.artifact_registry.repository_iam.require_service_account_member

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository_iam.vars

conditions := [
  [
    {
      "situation_description": "The IAM member is not a service account.",
      "remedies": [
        "Use service accounts for Artifact Registry IAM bindings.",
        "Avoid using user:* or group:* identities; instead, prefer serviceAccount:*."
      ]
    },
    {
      "condition": "Check if IAM member is a service account.",
      "attribute_path": ["member"],
      "values": ["^serviceAccount:.*$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
