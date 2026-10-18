package terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.access_settings_workforce_identity_pool_provider

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.vars

conditions := [
    [
        {
            "situation_description": "Widget config workforce identity pool provider does not follow the required structural path format",
            "remedies": [
                "Set access_settings.workforce_identity_pool_provider to a valid provider path following the format: locations/{location}/workforcePools/{pool}/providers/{provider}"
            ]
        },
        {
            "condition": "workforce_identity_pool_provider must follow the approved structural pattern",
            "attribute_path": ["access_settings", 0, "workforce_identity_pool_provider"],
            "values": [
                "locations/*/workforcePools/*/providers/*",
                [
                    ["global", "us", "eu"],
                    ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"],
                    ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
