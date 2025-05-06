package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.ports

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run container uses a non-approved port.",
      "remedies": ["Use an approved port such as 8080."]
    },
    {
      "condition": "Container port must be 8080.",
      "attribute_path": ["template", "containers", 0, "ports", 0, "container_port"],
      "values": [8080],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
