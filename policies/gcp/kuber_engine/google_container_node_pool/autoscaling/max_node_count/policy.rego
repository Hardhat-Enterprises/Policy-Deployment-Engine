package terraform.gcp.security.kuber_engine.google_container_node_pool.autoscaling.max_node_count

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_node_pool.vars

conditions := [
  [
    {
      "situation_description": "Autoscaling max_node_count is too low, which can lead to resource exhaustion during traffic spikes.",
      "remedies": ["Set autoscaling.max_node_count to at least 3 to ensure enough capacity for scaling."]
    },
    {
      "condition": "Check that max_node_count is greater than or equal to 3.",
      "attribute_path": ["autoscaling", 0, "max_node_count"],
      "values": [3, null],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
