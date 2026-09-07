package terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.access_settings_workforce_identity_pool_provider

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.vars

conditions := [
    [
        {
            "situation_description": "Widget config does not specify a valid workforce identity pool provider",
            "remedies": [
                "Set access_settings.workforce_identity_pool_provider to a valid provider path e.g. locations/global/workforcePools/<pool>/providers/<provider>"
            ]
        },
        {
            "condition": "workforce_identity_pool_provider must not be empty or invalid",
            "attribute_path": ["access_settings", 0, "workforce_identity_pool_provider"],
            "values": [null, "", "invalid-provider"],
            "policy_type": "blacklist"
        },
        {
            "condition": "workforce_identity_pool_provider must follow the approved structural pattern",
            "attribute_path": ["access_settings", 0, "workforce_identity_pool_provider"],
            "values": [
                "locations/*/workforcePools/*/providers/*",
                [
                    ["global"],
                    ["example-pool"],
                    ["example-provider"]
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
