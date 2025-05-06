package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job_iam_binding.cloud_role

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Job IAM binding uses an overly permissive or insecure role",
      "remedies": ["Use least-privilege roles such as 'roles/run.invoker' or 'roles/viewer'"]
    },
    {
      "condition": "IAM binding should not use powerful roles like 'roles/owner'",
      "attribute_path": "role",
      "values": ["roles/owner", "roles/editor"],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Job IAM binding must include an approved role",
      "remedies": ["Ensure the IAM role is among approved roles like 'roles/run.invoker'"]
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
