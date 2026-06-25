package terraform.gcp.security.cloud_run.google_cloud_run_service.template_spec_containers_env_value_from_secret_key_ref_key

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service uses an unapproved Secret Manager secret version",
      "remedies": [
        "Use an approved Secret Manager secret version",
        "Set secret_key_ref key to latest"
      ]
    },
    {
      "condition": "Secret reference key must use an approved value",
      "attribute_path": ["template", 0, "spec", 0, "containers", 0, "env", 0, "value_from", 0, "secret_key_ref", 0, "key"],
      "values": ["latest"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

