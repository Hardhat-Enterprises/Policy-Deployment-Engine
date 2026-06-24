package terraform.gcp.security.cloud_run.google_cloud_run_service.template.spec.service_account_name

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service is using an unapproved service account",
      "remedies": [
        "Use an approved least-privilege service account",
        "Set service_account_name to secure-sa@my-gcp-project.iam.gserviceaccount.com"
      ]
    },
    {
      "condition": "Service account must be approved",
      "attribute_path": ["template", 0, "spec", 0, "service_account_name"],
      "values": ["secure-sa@my-gcp-project.iam.gserviceaccount.com"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

