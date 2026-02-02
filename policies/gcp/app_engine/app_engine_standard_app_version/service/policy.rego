package terraform.gcp.security.app_engine.app_engine_standard_app_version.service

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.app_engine_standard_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine Standard service name does not follow the naming standards required",
            "remedies": ["Rename the service to 'default' or a name starting with 'hh-' (e.g., 'hh-frontend')"]
        },
        {
            "condition": "Check if service name is 'default' or prefixed with 'hh-'",
            "attribute_path": ["service"],
            "values": ["*", [["default", "hh-*"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details