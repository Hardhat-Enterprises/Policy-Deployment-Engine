package terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.access_settings_allow_public_access

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.vars

conditions := [
    [
        {
            "situation_description": "Widget config allows unauthenticated public access",
            "remedies": [
                "Set access_settings.allow_public_access to false"
            ]
        },
        {
            "condition": "allow_public_access must be false",
            "attribute_path": ["access_settings", 0, "allow_public_access"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
