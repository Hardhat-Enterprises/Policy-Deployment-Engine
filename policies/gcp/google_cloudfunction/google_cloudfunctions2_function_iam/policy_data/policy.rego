package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function_iam.policy_data

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM policy may overwrite existing secure bindings and introduce public access.",
      "remedies": [
        "Avoid using 'allUsers' or 'allAuthenticatedUsers' in policy bindings.",
        "Use 'iam_binding' or 'iam_member' for additive changes.",
        "Review 'policy_data' to ensure it does not grant broad access."
      ]
    },
    {
      "condition": "IAM policy must not contain public members.",
      "attribute_path": ["policy_data", "bindings", "members"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "IAM policy assigns overly permissive roles.",
      "remedies": [
        "Avoid using 'roles/owner' or 'roles/editor' in IAM policy bindings.",
        "Use least-privilege roles like 'roles/cloudfunctions.invoker'."
      ]
    },
    {
      "condition": "IAM policy must not contain overly permissive roles.",
      "attribute_path": ["policy_data", "bindings", "role"],
      "values": ["roles/owner", "roles/editor"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details