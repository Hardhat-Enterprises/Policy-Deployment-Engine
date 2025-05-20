package terraform.gcp.security.kuber_engine.google_container_cluster.addons_config.horizontal_pod_autoscaling

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
  [
    {
      "situation_description": "HPA is disabled, increasing risk of resource exhaustion or DoS attacks under high load.",
      "remedies": ["Set horizontal_pod_autoscaling.disabled = false"]
    },
    {
      "condition": "Horizontal Pod Autoscaling must be enabled",
      "attribute_path": ["addons_config", 0, "horizontal_pod_autoscaling", 0, "disabled"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
