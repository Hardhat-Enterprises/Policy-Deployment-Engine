package terraform.gcp.security.compute_engine.google_compute_region_security_policy.advanced_options_config_json_parsing

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "JSON request parsing is disabled, reducing WAF inspection visibility.",
            "remedies": [
                "Set advanced_options_config.json_parsing to STANDARD_WITH_GRAPHQL."
            ]
        },
        {
            "condition": "JSON parsing must be STANDARD_WITH_GRAPHQL",
            "attribute_path": ["advanced_options_config", 0, "json_parsing"],
            "values": ["STANDARD_WITH_GRAPHQL"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details