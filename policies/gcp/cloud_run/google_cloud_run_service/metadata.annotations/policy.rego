package terraform.gcp.security.cloud_run.google_cloud_run_service.metadata.annotations

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service allows public ingress",
      "remedies": [
        "Restrict ingress to internal only",
        "Use run.googleapis.com/ingress = internal"
      ]
    },
    {
      "condition": "Ingress must not be public",
      "attribute_path": ["metadata", 0, "annotations", "run.googleapis.com/ingress"],
      "values": ["internal"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

