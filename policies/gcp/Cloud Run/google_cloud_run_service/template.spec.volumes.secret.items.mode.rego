package terraform.gcp.security.cloud_run.google_cloud_run_service.template_spec_volumes_secret_items_mode

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service secret item uses overly permissive file permissions",
      "remedies": [
        "Use restrictive file permissions for mounted secret items",
        "Set secret item mode within the approved range"
      ]
    },
    {
      "condition": "Secret item mode must be within the approved range",
      "attribute_path": ["template", 0, "spec", 0, "volumes", 0, "secret", 0, "items", 0, "mode"],
      "values": [256, 384],
      "policy_type": "range"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

