package terraform.gcp.security.app_engine.app_engine_application.split_health_checks

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.app_engine_application.vars

conditions := [
  [
    {
      "situation_description": "App Engine is using legacy health checks",
      "remedies": ["Set feature_settings.split_health_checks to 'true' to use readiness and liveness checks"]
    },
    {
      "condition": "Ensure that split health checks are enabled",
      "attribute_path": ["feature_settings", 0, "split_health_checks"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details