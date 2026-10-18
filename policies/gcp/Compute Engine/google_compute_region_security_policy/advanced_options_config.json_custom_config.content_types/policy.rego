package terraform.gcp.security.compute_engine.google_compute_region_security_policy.advanced_options_config_json_custom_config_content_types

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The security policy does not include the approved JSON content type for custom JSON parsing.",
            "remedies": [
                "Include 'application/json' in advanced_options_config.json_custom_config.content_types."
            ]
        },
        {
            "condition": "Custom JSON content types must include application/json",
            "attribute_path": ["advanced_options_config", 0, "json_custom_config", 0, "content_types"],
            "values": ["application/json"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details