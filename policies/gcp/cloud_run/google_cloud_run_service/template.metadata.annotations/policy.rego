package terraform.gcp.security.cloud_run.google_cloud_run_service.template.metadata.annotations

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service template allows public ingress",
      "remedies": [
        "Restrict ingress to internal only",
        "Use run.googleapis.com/ingress = internal"
      ]
    },
    {
      "condition": "Template ingress must not be public",
      "attribute_path": ["template", 0, "metadata", 0, "annotations", "run.googleapis.com/ingress"],
      "values": ["internal"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details