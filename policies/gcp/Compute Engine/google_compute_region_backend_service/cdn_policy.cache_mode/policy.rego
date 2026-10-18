package terraform.gcp.security.compute_engine.google_compute_region_backend_service.cdn_policy_cache_mode

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_backend_service.vars

conditions := [
  [
    {
      "situation_description": "The CDN cache mode ignores the origin's own cache-control headers.",
      "remedies": ["Set 'cdn_policy.cache_mode' to 'USE_ORIGIN_HEADERS' or 'CACHE_ALL_STATIC' instead of 'FORCE_CACHE_ALL'."]
    },
    {
      "condition": "'cdn_policy.cache_mode' must not be 'FORCE_CACHE_ALL'",
      "attribute_path": ["cdn_policy", 0, "cache_mode"],
      "values": ["FORCE_CACHE_ALL"],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
