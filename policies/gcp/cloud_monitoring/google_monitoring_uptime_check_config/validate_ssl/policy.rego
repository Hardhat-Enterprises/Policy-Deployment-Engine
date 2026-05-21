package terraform.gcp.security.cloud_monitoring.google_monitoring_uptime_check_config.validate_ssl

import data.terraform.helpers
import data.terraform.gcp.security.cloud_monitoring.google_monitoring_uptime_check_config.vars

conditions := [
  [
    {
      "situation_description": "http_check.validate_ssl is set to false on an HTTPS uptime_url check, which allows the check to run without SSL certificate validation",
      "remedies": [
        "Set http_check.validate_ssl to true for HTTPS uptime_url checks"
      ]
    },
    {
      "condition": "monitored_resource type must be uptime_url",
      "attribute_path": ["monitored_resource", 0, "type"],
      "policy_type": "whitelist",
      "values": ["uptime_url"]
    },
    {
      "condition": "use_ssl must be true",
      "attribute_path": ["http_check", 0, "use_ssl"],
      "policy_type": "whitelist",
      "values": [true]
    },
    {
      "condition": "validate_ssl must be true",
      "attribute_path": ["http_check", 0, "validate_ssl"],
      "policy_type": "whitelist",
      "values": [true]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
