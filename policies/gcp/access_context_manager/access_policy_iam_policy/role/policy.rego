package terraform.gcp.security.access_context_manager.access_policy_iam_policy.role

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_context_manager.access_policy_iam_policy.vars

conditions := [
  [
    {
      "situation_description": "Overly permissive IAM role is assigned (e.g., Owner or Editor).",
      "remedies": [
        "Use least privilege roles like 'roles/viewer'.",
        "Avoid using broad roles like 'roles/owner' or 'roles/editor'."
      ]
    },
    {
      "condition": "Check if any IAM role is over-permissive.",
      "attribute_path": ["policy_data", "bindings", "*", "role"],  # JSON path inside policy_data
      "values": ["roles/owner", "roles/editor"],  # Blacklisted roles
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details