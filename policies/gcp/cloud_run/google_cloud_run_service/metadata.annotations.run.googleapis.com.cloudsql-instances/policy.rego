package terraform.gcp.security.cloud_run.google_cloud_run_service.metadata.annotations.run.googleapis.com.cloudsql_instances

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service connects to an unapproved Cloud SQL instance",
      "remedies": [
        "Use only approved Cloud SQL instance connections",
        "Set run.googleapis.com/cloudsql-instances to my-gcp-project:australia-southeast1:prod-db"
      ]
    },
    {
      "condition": "Cloud SQL instance annotation must use an approved instance connection",
      "attribute_path": ["template", 0, "metadata", 0, "annotations", "run.googleapis.com/cloudsql-instances"],
      "values": ["my-gcp-project:australia-southeast1:prod-db"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

