package terraform.gcp.security.cloud_run.google_cloud_run_service.project

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service is deployed in an unapproved GCP project",
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

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details