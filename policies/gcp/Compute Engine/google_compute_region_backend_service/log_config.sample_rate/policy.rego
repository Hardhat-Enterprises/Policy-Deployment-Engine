package terraform.gcp.security.compute_engine.google_compute_region_backend_service.log_config_sample_rate

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_backend_service.vars

conditions := [
  [
    {
      "situation_description": "The logging sample rate is 0, so no requests are logged even if logging is enabled.",
      "remedies": ["Set 'log_config.sample_rate' to a non-zero value (the default of 1.0 logs every request)."]
    },
    {
      "condition": "'log_config.sample_rate' must not be 0",
      "attribute_path": ["log_config", 0, "sample_rate"],
      "values": [0],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
