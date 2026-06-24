package terraform.gcp.security.cloud_run.google_cloud_run_service_iam.location

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service_iam.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service IAM policy is applied outside an approved location",
      "remedies": [
        "Use an approved Australian region",
        "Change the location to australia-southeast1 or australia-southeast2"
      ]
    },
    {
      "condition": "Location must be an approved region",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

