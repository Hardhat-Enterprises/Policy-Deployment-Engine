package terraform.gcp.security.app_engine.app_engine_flexible_app_version.liveness_check.path

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.app_engine_flexible_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine liveness check is pointing to an unapproved path",
            "remedies": ["set liveness_check.path to an approved endpoint (e.g. '/', '/healthz')"]
        },
        {
            "condition": "Whitelist approved liveness paths",
            "attribute_path": ["liveness_check", 0, "path"],
            "values": ["/", "/healthz"],
            "policy_type": "whitelist"
        }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details