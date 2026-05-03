package terraform.gcp.security.Cloud_IAM.google_iam_folders_policy_binding.policy_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_folders_policy_binding.vars

conditions := [
  [
    {
      "situation_description": "Folder policy binding must use an approved policy",
      "remedies": [
        "Use only approved Principal Access Boundary policies",
        "Ensure policy belongs to your organization"
      ]
    },
    {
      "condition": "Validate policy field",
      "attribute_path": ["policy"],
      "values": [
        "organizations/123456789/locations/global/principalAccessBoundaryPolicies/pde-policy-1",
        "organizations/123456789/locations/global/principalAccessBoundaryPolicies/pde-policy-2"
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details