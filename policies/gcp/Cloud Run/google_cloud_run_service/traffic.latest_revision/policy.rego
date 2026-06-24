package terraform.gcp.security.cloud_run.google_cloud_run_service.traffic.latest_revision

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service is not routing traffic to the latest revision",
      "remedies": [
        "Set latest_revision to true",
        "Ensure traffic is always directed to the latest approved deployment"
      ]
    },
    {
      "condition": "Traffic must use latest revision",
      "attribute_path": ["traffic", 0, "latest_revision"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

