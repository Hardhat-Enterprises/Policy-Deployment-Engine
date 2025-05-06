package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.deletion_protection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.vars

conditions := [
  [
    {
      "situation_description": "Deletion protection is not enabled for the Cloud Run v2 Job",
      "remedies": [
        "Set `deletion_protection = true` to protect jobs from accidental deletion"
      ]
    },
    {
      "condition": "Ensure deletion protection is enabled",
      "attribute_path": ["deletion_protection"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
