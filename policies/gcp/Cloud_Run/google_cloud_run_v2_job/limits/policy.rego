package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.limits

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run job is missing or misconfigured CPU and memory limits",
      "remedies": ["Ensure that containers specify resource limits of cpu='1' and memory='512Mi'"]
    },
    {
      "condition": "Check that container has cpu='1' and memory='512Mi'",
      "attribute_path": ["template", "template", "containers", 0,"resources", "limits"],
      "values": [{"cpu": "1", "memory": "512Mi"}],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
