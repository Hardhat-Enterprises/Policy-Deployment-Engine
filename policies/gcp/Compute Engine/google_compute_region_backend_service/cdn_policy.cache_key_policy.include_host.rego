package terraform.gcp.security.compute_engine.google_compute_region_backend_service.cdn_policy_cache_key_policy_include_host

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_backend_service.vars

conditions := [
  [
    {
      "situation_description": "The CDN cache key does not separate requests by host.",
      "remedies": ["Set 'cdn_policy.cache_key_policy.include_host' to true so responses for different hosts are never cached together."]
    },
    {
      "condition": "'cdn_policy.cache_key_policy.include_host' must be true",
      "attribute_path": ["cdn_policy", 0, "cache_key_policy", 0, "include_host"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
