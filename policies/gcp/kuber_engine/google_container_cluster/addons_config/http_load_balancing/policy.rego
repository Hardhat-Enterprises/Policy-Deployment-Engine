package terraform.gcp.security.kuber_engine.google_container_cluster.addons_config.http_load_balancing

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
  [
    {
      "situation_description": "HTTP Load Balancing is disabled, which could reduce availability under high traffic.",
      "remedies": ["Set http_load_balancing.disabled = false"]
    },
    {
      "condition": "HTTP Load Balancing must be enabled",
      "attribute_path": ["addons_config", 0, "http_load_balancing", 0, "disabled"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
