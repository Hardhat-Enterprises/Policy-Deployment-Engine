package terraform.gcp.security.compute_engine.google_compute_region_security_policy.advanced_options_config_log_level

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "Compute Region Security Policy does not use the recommended VERBOSE logging level.",
            "remedies": [
                "Set advanced_options_config.log_level to VERBOSE."
            ]
        },
        {
            "condition": "Log level must be VERBOSE",
            "attribute_path": ["advanced_options_config", 0, "log_level"],
            "values": ["VERBOSE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details