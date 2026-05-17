package terraform.gcp.security.cloud_run.google_cloud_run_service_iam.service

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service_iam.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service IAM policy is attached to an unapproved service",
      "remedies": [
        "Attach the IAM policy only to approved Cloud Run services",
        "Change the service field to cloudrun-srv"
      ]
    },
    {
      "condition": "Service must be approved",
      "attribute_path": ["service"],
      "values": ["cloudrun-srv"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

