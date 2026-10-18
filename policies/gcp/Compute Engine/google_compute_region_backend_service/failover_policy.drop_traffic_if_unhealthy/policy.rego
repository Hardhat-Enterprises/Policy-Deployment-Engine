package terraform.gcp.security.compute_engine.google_compute_region_backend_service.failover_policy_drop_traffic_if_unhealthy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_backend_service.vars

conditions := [
  [
    {
      "situation_description": "Traffic is still sent to backends when every VM has failed its health check.",
      "remedies": ["Set 'failover_policy.drop_traffic_if_unhealthy' to true so traffic is dropped instead of routed to backends already known to be unhealthy."]
    },
    {
      "condition": "'failover_policy.drop_traffic_if_unhealthy' must be true",
      "attribute_path": ["failover_policy", 0, "drop_traffic_if_unhealthy"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
