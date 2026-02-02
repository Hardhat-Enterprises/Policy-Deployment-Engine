package terraform.gcp.security.app_engine.app_engine_flexible_app_version.service

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.app_engine_flexible_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine service name does not meet naming standards",
            "remedies": ["Rename the service to 'default' or use the 'hh-' prefix (e.g.'hh-frontend')"]
        },
        {
            "condition": "Service name must be 'default' or start with 'hh-'",
            "attribute_path": ["service"],
            "values": ["*", [["default", "hh-*"]]], 
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details