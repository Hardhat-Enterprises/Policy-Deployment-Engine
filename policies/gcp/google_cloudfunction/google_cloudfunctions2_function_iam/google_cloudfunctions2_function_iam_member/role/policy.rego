package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function_iam.policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function_iam.google_cloudfunctions2_function_iam_member.vars

conditions := [
[
    {
      "situation_description": "IAM role assigns overly permissive roles.",
      "remedies": [
        "Avoid using 'roles/owner' or 'roles/editor' in IAM policy bindings.",
        "Use least-privilege roles like 'roles/cloudfunctions.invoker'."
      ]
    },
    {
      "condition": "IAM role must not contain overly permissive roles.",
      "attribute_path": ["role"],
      "values": ["roles/owner", "roles/editor"],
      "policy_type": "blacklist"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details