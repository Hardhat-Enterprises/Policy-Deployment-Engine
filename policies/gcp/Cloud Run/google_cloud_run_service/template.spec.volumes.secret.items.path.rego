package terraform.gcp.security.cloud_run.google_cloud_run_service.template_spec_volumes_secret_items_path

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service secret volume uses an unapproved secret item path",
      "remedies": [
        "Use an approved secret item path",
        "Set the secret item path to db-password"
      ]
    },
    {
      "condition": "Secret item path must be approved",
      "attribute_path": ["template", 0, "spec", 0, "volumes", 0, "secret", 0, "items", 0, "path"],
      "values": ["db-password"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

