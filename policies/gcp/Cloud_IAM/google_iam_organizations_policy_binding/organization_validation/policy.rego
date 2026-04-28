package terraform.gcp.security.Cloud_IAM.google_iam_organizations_policy_binding.organization_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_organizations_policy_binding.vars

conditions := [
  [
    {
      "situation_description": "Organization ID must be numeric",
      "remedies": [
        "Use valid numeric organization ID",
        "Example: 224774388"
      ]
    },
    {
      "condition": "Validate organization ID pattern",
      "attribute_path": ["organization"],
      "values": ["^[0-9]+$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details