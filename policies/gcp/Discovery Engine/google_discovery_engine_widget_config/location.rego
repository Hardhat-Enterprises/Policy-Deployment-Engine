package terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.location

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.vars

conditions := [
    [
        {
            "situation_description": "Widget config location is outside approved regions",
            "remedies": [
                "Set location to eu"
            ]
        },
        {
            "condition": "location must be an approved value",
            "attribute_path": ["location"],
            "values": ["eu"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
