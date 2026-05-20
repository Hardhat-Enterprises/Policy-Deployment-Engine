package terraform.gcp.security.cloud_run.google_cloud_run_service.template.spec.timeout_seconds

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service timeout is outside the approved range",
      "remedies": [
        "Set timeout_seconds between 1 and 300",
        "Avoid excessive timeout values that can tie up resources for too long"
      ]
    },
    {
      "condition": "Timeout seconds must be within the approved range",
      "attribute_path": ["template", 0, "spec", 0, "timeout_seconds"],
      "values": [1, 300],
      "policy_type": "range"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

