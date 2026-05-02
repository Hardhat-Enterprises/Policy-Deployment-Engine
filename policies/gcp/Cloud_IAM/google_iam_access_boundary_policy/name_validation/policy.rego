package terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.name_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.vars

conditions := [
  [
    {
      "situation_description": "Ensure the access boundary policy has a non-empty name defined.",
      "remedies": [
        "Set the 'name' attribute to a descriptive, non-empty string that clearly identifies the policy's purpose."
      ]
    },
    {
      "condition": "name must not be null or empty",
      "attribute_path": ["name"],
      "values": null,
      "policy_type": "blacklist"
    }
  ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details