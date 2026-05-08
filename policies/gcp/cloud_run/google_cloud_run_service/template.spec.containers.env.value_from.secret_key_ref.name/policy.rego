package terraform.gcp.security.cloud_run.google_cloud_run_service.template.spec.containers.env.value_from.secret_key_ref.name

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service references an unapproved Secret Manager secret name",
      "remedies": [
        "Use approved Secret Manager secret names",
        "Use a secret name that follows the approved pattern such as prod-db-secret"
      ]
    },
    {
      "condition": "Secret reference name must match the approved naming pattern",
      "attribute_path": ["template", 0, "spec", 0, "containers", 0, "env", 0, "value_from", 0, "secret_key_ref", 0, "name"],
      "values": [
        "prod-db-secret"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details