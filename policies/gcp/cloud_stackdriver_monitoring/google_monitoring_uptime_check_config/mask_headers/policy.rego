package terraform.gcp.security.cloud_monitoring.google_monitoring_uptime_check_config.mask_headers

import data.terraform.helpers
import data.terraform.gcp.security.cloud_monitoring.google_monitoring_uptime_check_config.vars

conditions := [
  [
    {
      "situation_description": "An Authorization header is configured while mask_headers is disabled, which may expose authentication data when retrieving the uptime check configuration",
      "remedies": [
        "Set http_check.mask_headers to true when using authentication-related headers such as Authorization"
      ]
    },
    {
      "condition": "Authorization header is configured",
      "attribute_path": ["http_check", 0, "headers", "Authorization"],
      "policy_type": "blacklist",
      "values": [null, ""]
    },
    {
      "condition": "mask_headers must be true",
      "attribute_path": ["http_check", 0, "mask_headers"],
      "policy_type": "whitelist",
      "values": [true]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
