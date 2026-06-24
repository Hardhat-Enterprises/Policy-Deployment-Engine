package terraform.gcp.security.cloud_run.google_cloud_run_service.traffic.percent

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service traffic percent is not set to the approved value",
      "remedies": [
        "Set traffic percent to 100 for the approved revision",
        "Avoid leaving traffic percent at 0 because it may prevent traffic from reaching the intended revision"
      ]
    },
    {
      "condition": "Traffic percent must be 100",
      "attribute_path": ["traffic", 0, "percent"],
      "values": [0,100],
      "policy_type": "range"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

