package terraform.gcp.security.compute_engine.google_compute_region_backend_service.iap_enabled

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_backend_service.vars

conditions := [
  [
    {
      "situation_description": "Identity-Aware Proxy is configured but switched off.",
      "remedies": ["Set 'iap.enabled' to true, or remove the 'iap' block if IAP is not intended."]
    },
    {
      "condition": "'iap.enabled' must not be false",
      "attribute_path": ["iap", 0, "enabled"],
      "values": [false],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
