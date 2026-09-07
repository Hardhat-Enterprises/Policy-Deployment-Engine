package terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.access_settings_workforce_identity_pool_provider

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.vars

conditions := [
    [
        {
            "situation_description": "Widget config does not specify a workforce identity pool provider",
            "remedies": [
                "Set access_settings.workforce_identity_pool_provider to an approved identity pool provider"
            ]
        },
        {
            "condition": "workforce_identity_pool_provider must not be empty",
            "attribute_path": ["access_settings", 0, "workforce_identity_pool_provider"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
