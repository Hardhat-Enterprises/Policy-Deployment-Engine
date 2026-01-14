package terraform.gcp.security.app_engine.app_engine_flexible_app_version.readiness_check.path

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.app_engine_flexible_app_version.vars

conditions := [
    [
        {
        "situation_description": "App Engine readiness check is pointing to a path that is unapproved",
        "remedies": ["Set 'readiness_check.path' to an approved endpoint (e.g. '/', '/health')"]
        },
        {
        "condition": "Ensure readiness check path is allowed",
        "attribute_path": ["readiness_check", 0, "path"],
        "values": ["/", "/health"],
        "policy_type": "whitelist"
        }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details