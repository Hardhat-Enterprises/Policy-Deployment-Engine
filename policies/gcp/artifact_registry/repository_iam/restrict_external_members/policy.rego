package terraform.gcp.security.artifact_registry.repository_iam.restrict_external_members

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository_iam.vars

conditions := [

  # Situation 1: Block public access
  [
    {
      "situation_description": "IAM member is publicly accessible via allUsers or allAuthenticatedUsers.",
      "remedies": [
        "Do not assign roles to allUsers or allAuthenticatedUsers.",
        "Use specific users, groups, or service accounts instead."
      ]
    },
    {
      "condition": "Block public IAM members.",
      "attribute_path": ["member"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ],

  # Situation 2: Allow only members from an approved domain
  [
    {
      "situation_description": "IAM member does not belong to the approved organization domain (e.g., @your-company.com).",
      "remedies": [
        "Use only users, groups, or service accounts from @your-company.com.",
        "Avoid external domains such as gmail.com or yahoo.com."
      ]
    },
    {
      "condition": "Allow only members from the approved domain.",
      "attribute_path": ["member"],
      "values": [["^user:.*@your-company\\.com$", "^group:.*@your-company\\.com$", "^serviceAccount:.*@your-company\\.iam\\.gserviceaccount\\.com$"]],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
