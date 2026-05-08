package terraform.gcp.security.cloud_run.google_cloud_run_service.metadata.annotations.run.googleapis.com.binary_authorization_breakglass

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service uses Binary Authorization breakglass override",
      "remedies": [
        "Disable Binary Authorization breakglass usage",
        "Remove run.googleapis.com/binary-authorization-breakglass annotation"
      ]
    },
    {
      "condition": "Binary Authorization breakglass must not be enabled",
      "attribute_path": ["metadata", 0, "annotations", "run.googleapis.com/binary-authorization-breakglass"],
      "values": [""],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details