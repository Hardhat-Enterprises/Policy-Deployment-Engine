package terraform.gcp.security.compute_engine.google_compute_region_backend_service.log_config_enable

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_backend_service.vars

conditions := [
  [
    {
      "situation_description": "Load balancer traffic logging is not enabled on the backend service.",
      "remedies": ["Set 'log_config.enable' to true so traffic through this backend service is logged."]
    },
    {
      "condition": "'log_config.enable' must be true",
      "attribute_path": ["log_config", 0, "enable"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
