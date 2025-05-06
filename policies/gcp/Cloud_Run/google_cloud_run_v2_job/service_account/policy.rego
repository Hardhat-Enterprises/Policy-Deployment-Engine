package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.service_account

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.vars

conditions := [
  [
    {
      "situation_description": "Job is missing a service account",
      "remedies": ["Specify a secure, least-privilege service account using the 'service_account' attribute"]
    },
    {
      "condition": "Ensure 'service_account' is not missing or empty",
      "attribute_path": ["template", "template", "service_account"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
