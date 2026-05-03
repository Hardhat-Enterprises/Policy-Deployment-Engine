package terraform.gcp.security.Cloud_IAM.google_iam_folders_policy_binding.policy_kind_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_folders_policy_binding.vars

conditions := [
  [
    {
      "situation_description": "Only approved policy kinds are allowed for folder policy bindings",
      "remedies": [
        "Use PRINCIPAL_ACCESS_BOUNDARY as the policy_kind",
        "Avoid using ACCESS or unspecified policy kinds"
      ]
    },
    {
      "condition": "Validate policy_kind field",
      "attribute_path": ["policy_kind"],
      "values": ["PRINCIPAL_ACCESS_BOUNDARY"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details