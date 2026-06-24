package terraform.gcp.security.cloud_run.google_cloud_run_service.template_spec_volumes_secret_default_mode

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service secret volume uses overly permissive default file permissions",
      "remedies": [
        "Use restrictive file permissions for mounted secrets",
        "Set default_mode within the approved range"
      ]
    },
    {
      "condition": "Secret default mode must be within the approved range",
      "attribute_path": ["template", 0, "spec", 0, "volumes", 0, "secret", 0, "default_mode"],
      "values": [256, 384],
      "policy_type": "range"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

