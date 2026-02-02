package terraform.gcp.security.app_engine.app_engine_flexible_app_version.readiness_check.failure_threshold

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.app_engine_flexible_app_version.vars


conditions := [
  [
    {
      "situation_description": "failure_threshold is too low/not safely configured",
      "remedies": ["Set failure_threshold to at least 1"
      ]
    },
    {
      "condition": "Check that failure_threshold is below minimum safe value",
      "attribute_path": ["readiness_check", 0, "failure_threshold"],
      "values": [1, null],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details