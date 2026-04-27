package terraform.gcp.security.Cloud_IAM.google_iam_principal_access_boundary_policy.organization_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_principal_access_boundary_policy.organization_validation.vars

conditions := [
  [
    {
      "situation_description": "Organization ID must be numeric only",
      "remedies": [
        "Use a valid GCP organization ID",
        "Example: 123456789"
      ]
    },
    {
      "condition": "Validate organization format",
      "attribute_path": ["organization"],
      "values": ["^[0-9]+$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details