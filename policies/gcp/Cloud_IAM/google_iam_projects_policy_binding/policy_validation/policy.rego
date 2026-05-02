package terraform.gcp.security.Cloud_IAM.google_iam_projects_policy_binding.policy_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_projects_policy_binding.vars

conditions := [

  [
    {
      "situation_description": "Policy must be provided and follow valid GCP IAM policy binding format",
      "remedies": [
        "Provide a valid policy path",
        "Ensure format: organizations/<org-id>/locations/global/principalAccessBoundaryPolicies/<policy-id>",
        "Do not leave policy empty"
      ]
    },
    {
      "condition": "Policy must not be empty",
      "attribute_path": ["policy"],
      "values": ["^.+$"],
      "policy_type": "pattern whitelist"
    }
  ],

  [
    {
      "situation_description": "Policy must follow valid IAM policy binding structure",
      "remedies": [
        "Use correct organization-based policy resource path"
      ]
    },
    {
      "condition": "Validate policy format",
      "attribute_path": ["policy"],
      "values": ["^organizations/[0-9]+/locations/global/principalAccessBoundaryPolicies/[a-zA-Z0-9-]+$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details