package terraform.gcp.security.cloud_run.google_cloud_run_service.metadata.annotations.run.googleapis.com.custom_audiences

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service uses unapproved custom audiences",
      "remedies": [
        "Use approved custom audiences only",
        "Avoid wildcard custom audience values"
      ]
    },
    {
      "condition": "Custom audiences must not use wildcard values",
      "attribute_path": ["metadata", 0, "annotations", "run.googleapis.com/custom-audiences"],
      "values": ["*"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

