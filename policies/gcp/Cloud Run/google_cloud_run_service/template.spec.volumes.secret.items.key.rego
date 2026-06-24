package terraform.gcp.security.cloud_run.google_cloud_run_service.template_spec_volumes_secret_items_key

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service secret volume uses an unapproved secret item key",
      "remedies": [
        "Use an approved secret item key",
        "Set the secret item key to latest"
      ]
    },
    {
      "condition": "Secret item key must be approved",
      "attribute_path": ["template", 0, "spec", 0, "volumes", 0, "secret", 0, "items", 0, "key"],
      "values": ["latest"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

