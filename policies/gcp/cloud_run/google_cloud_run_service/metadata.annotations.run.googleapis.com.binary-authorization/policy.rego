package terraform.gcp.security.cloud_run.google_cloud_run_service.metadata.annotations.run.googleapis.com.binary_authorization

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service does not use approved binary authorization configuration",
      "remedies": [
        "Enable binary authorization for Cloud Run",
        "Set run.googleapis.com/binary-authorization to default"
      ]
    },
    {
      "condition": "Binary authorization annotation must use an approved value",
      "attribute_path": ["template", 0, "metadata", 0, "annotations", "run.googleapis.com/binary-authorization"],
      "values": ["default"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details