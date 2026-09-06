package terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.ui_settings_enable_safe_search

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.vars

conditions := [
    [
        {
            "situation_description": "Widget config does not have safe search enabled",
            "remedies": [
                "Set ui_settings.enable_safe_search to true"
            ]
        },
        {
            "condition": "enable_safe_search must be true",
            "attribute_path": ["ui_settings", 0, "enable_safe_search"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
