package terraform.gcp.security.kuber_engine.google_container_node_pool.autoscaling.location_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_node_pool.vars

conditions := [

  [
    {
      "situation_description": "Location policy for autoscaling is not set to 'BALANCED', which may result in uneven node distribution across zones.",
      "remedies": ["Set autoscaling.location_policy to 'BALANCED' for optimal zone distribution."]
    },
    {
      "condition": "Check that location_policy is set to 'BALANCED'.",
      "attribute_path": ["autoscaling", 0, "location_policy"],
      "values": ["BALANCED"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
