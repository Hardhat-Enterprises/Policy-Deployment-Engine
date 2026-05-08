package terraform.gcp.security.cloud_run.google_cloud_run_service.metadata.annotations.autoscaling.knative.dev.maxScale

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service max scale is outside the approved range",
      "remedies": [
        "Set maxScale within the approved range",
        "Avoid excessive scaling limits that can increase cost or abuse risk"
      ]
    },
    {
      "condition": "Max scale must be within the approved range",
      "attribute_path": ["template", 0, "metadata", 0, "annotations", "autoscaling.knative.dev/maxScale"],
      "values": [1, 50],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details