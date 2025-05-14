package terraform.gcp.security.azurenodepool.node_pool.node_count_range

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurenodepool.vars

conditions := [
  {
    "situation_description": "Node pool minimum node count must be at least 1",
    "remedies": ["Set autoscaling.min_node_count to 1 or higher"],
    "condition": "Minimum node count too low",
    "attribute_path": ["values", "autoscaling", 0, "min_node_count"],
    "range": {
      "min": 1
    },
    "policy_type": "range"
  },
  {
    "situation_description": "Node pool maximum node count must not exceed 5",
    "remedies": ["Set autoscaling.max_node_count to 5 or lower"],
    "condition": "Maximum node count too high",
    "attribute_path": ["values", "autoscaling", 0, "max_node_count"],
    "range": {
      "max": 5
    },
    "policy_type": "range"
  }
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
detail := summary.details
