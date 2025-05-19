package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.ingress

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service allows unrestricted ingress traffic.",
      "remedies": [
        "Set ingress to 'INGRESS_TRAFFIC_INTERNAL_ONLY' or 'INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER'.",
        "This limits external exposure and reduces risk."
      ]
    },
    {
      "condition": "Restrict ingress setting",
      "attribute_path": ["ingress"],
      "values": ["INGRESS_TRAFFIC_ALL"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
