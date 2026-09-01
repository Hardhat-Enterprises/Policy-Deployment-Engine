package terraform.gcp.security.cloud_run.google_cloud_run_service.template_spec_service_account_name

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
      "values": ["*@*", [["secure-sa"], ["my-gcp-project.iam.gserviceaccount.com"]]],
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {
      "situation_description": "Cloud Run service runs as the Compute Engine default service account",
      "remedies": [
        "Create a dedicated least-privilege service account for this service",
        "Set service_account_name to that account instead of leaving it unset"
      ]
    },
    {
      # The pattern whitelist above can only judge a value that looks like an
      # email address, so "default" -- the runtime's own fallback -- has to be
      # named here or nothing catches it.
      "condition": "Service account must not be the runtime default",
      "attribute_path": ["template", 0, "spec", 0, "service_account_name"],
      "values": ["default"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

