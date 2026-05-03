package terraform.gcp.security.Cloud_IAM.google_iam_projects_policy_binding.policy_kind_restriction

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_projects_policy_binding.vars

conditions := [
  [
    {
      "situation_description": "Policy binding must enforce only Principal Access Boundary to prevent privilege escalation via access policies",
      "remedies": [
        "Set policy_kind strictly to PRINCIPAL_ACCESS_BOUNDARY",
        "Avoid using ACCESS or unspecified policy kinds",
        "Standardize IAM boundary enforcement across all projects"
      ]
    },
    {
      "condition": "Enforce secure policy kind usage",
      "attribute_path": ["policy_kind"],
      "values": ["PRINCIPAL_ACCESS_BOUNDARY"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details