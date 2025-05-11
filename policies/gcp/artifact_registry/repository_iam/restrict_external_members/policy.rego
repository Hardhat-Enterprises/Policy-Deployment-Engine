package terraform.gcp.security.artifact_registry.repository_iam.restrict_external_members

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository_iam.vars

conditions := [
  {
    "situation_description": "IAM member belongs to an external domain.",
    "remedies": [
      "Use members from the approved organization only (e.g., @your-company.com)."
    ]
  },
  {
    "condition": "Disallow IAM bindings to members outside approved domains.",
    "attribute_path": ["member"],
    "values": ["@(gmail\\.com|yahoo\\.com|hotmail\\.com|outlook\\.com)"],
    "policy_type": "pattern blacklist"
  }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
