package terraform.gcp.security.compute_engine.google_compute_global_forwarding_rule.source_ip_ranges

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_global_forwarding_rule.vars

conditions := [
  [
    {
      "situation_description": "The forwarding rule accepts traffic from any source IP address.",
      "remedies": ["Set 'source_ip_ranges' to a scoped, non-empty allowlist of CIDR ranges instead of leaving it empty or set to '0.0.0.0/0'."]
    },
    {
      "condition": "'source_ip_ranges' must be a restricted, non-empty allowlist",
      "attribute_path": ["source_ip_ranges"],
      "values": [[], "0.0.0.0/0"],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
