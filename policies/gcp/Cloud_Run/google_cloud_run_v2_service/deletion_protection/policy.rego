package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.deletion_protection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service does not have deletion protection enabled",
      "remedies": ["Add 'lifecycle.prevent_destroy = true' to prevent accidental deletion"]
    },
    {
      "condition": "Ensure 'prevent_destroy' is true",
      "attribute_path": ["lifecycle", "prevent_destroy"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
