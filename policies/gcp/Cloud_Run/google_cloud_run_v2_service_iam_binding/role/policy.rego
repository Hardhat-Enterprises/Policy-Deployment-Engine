package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service_iam_binding.role

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Service IAM binding must include an approved role",
      "remedies": [
        "Ensure the IAM role is among approved roles like 'roles/run.invoker' or 'roles/viewer'."
      ]
    },
    {
      "condition": "IAM binding should use allowed roles",
      "attribute_path": "role",
      "values": ["roles/run.invoker", "roles/viewer"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
