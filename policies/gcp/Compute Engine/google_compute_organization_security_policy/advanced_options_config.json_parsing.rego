package terraform.gcp.security.compute_engine.google_compute_organization_security_policy.advanced_options_config_json_parsing

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_organization_security_policy.vars

conditions := [
    [
        {
            "situation_description": "JSON body parsing is disabled, so malicious payloads in JSON request bodies may bypass WAF inspection.",
            "remedies": [
                "Set advanced_options_config.json_parsing to STANDARD or STANDARD_WITH_GRAPHQL."
            ]
        },
        {
            "condition": "Check if json_parsing enables JSON inspection",
            "attribute_path": ["advanced_options_config", 0, "json_parsing"],
            "values": ["STANDARD", "STANDARD_WITH_GRAPHQL"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
