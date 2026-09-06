package terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.ui_settings_disable_user_events_collection

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.vars

conditions := [
    [
        {
            "situation_description": "Widget config is collecting user events",
            "remedies": [
                "Set ui_settings.disable_user_events_collection to true"
            ]
        },
        {
            "condition": "disable_user_events_collection must be true",
            "attribute_path": ["ui_settings", 0, "disable_user_events_collection"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
