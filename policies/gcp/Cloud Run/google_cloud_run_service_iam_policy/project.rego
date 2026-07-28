package terraform.gcp.security.cloud_run.google_cloud_run_service_iam_policy.project

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service_iam_policy.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service IAM policy is applied to an unapproved GCP project",
      "remedies": [
        "Use an approved GCP project",
        "Change the project field to my-gcp-project"
      ]
    },
    {
      "condition": "Project must be approved",
      "attribute_path": ["project"],
      "values": ["my-gcp-project"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

