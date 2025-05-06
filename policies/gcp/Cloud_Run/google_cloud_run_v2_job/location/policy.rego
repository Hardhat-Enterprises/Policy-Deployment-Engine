package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.vars

conditions := [
  [
    {
      "situation_description": "Job is not deployed in an approved region",
      "remedies": [
        "Set 'location' to one of the approved values like AU"
      ]
    },
    {
      "condition": "Ensure location is in the approved list",
      "attribute_path": ["location"],  # ✅ fixed path (no "values")
      "values": ["AU"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
