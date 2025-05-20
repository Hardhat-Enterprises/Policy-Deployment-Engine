package terraform.gcp.security.kuber_engine.google_container_cluster.addons_config.dns_cache_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [
  [
    {
      "situation_description": "DNS Cache Addon is disabled, which may impact performance and latency.",
      "remedies": ["Set dns_cache_config.enabled = true"]
    },
    {
      "condition": "DNS Cache Addon must be enabled",
      "attribute_path": ["addons_config", 0, "dns_cache_config", 0, "enabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
