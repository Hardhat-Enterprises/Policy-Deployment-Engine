package terraform.gcp.security.cloud_run.google_cloud_run_service.template.spec.containers.resources.limits

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service CPU limit is outside the approved range",
      "remedies": [
        "Set CPU limits within the approved range",
        "Avoid excessive CPU limits that can increase cost or resource abuse risk"
      ]
    },
    {
      "condition": "CPU limit must be within the approved range",
      "attribute_path": ["template", 0, "spec", 0, "containers", 0, "resources", 0, "limits", "cpu"],
      "values": [0.08, 2],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details