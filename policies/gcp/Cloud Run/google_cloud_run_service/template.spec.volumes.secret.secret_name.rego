package terraform.gcp.security.cloud_run.google_cloud_run_service.template_spec_volumes_secret_secret_name

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service mounts an unapproved secret",
      "remedies": [
        "Use an approved Secret Manager secret",
        "Set secret_name to prod-db-secret"
      ]
    },
    {
      "condition": "Mounted secret name must be approved",
      "attribute_path": ["template", 0, "spec", 0, "volumes", 0, "secret", 0, "secret_name"],
      "values": ["prod-db-secret"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

