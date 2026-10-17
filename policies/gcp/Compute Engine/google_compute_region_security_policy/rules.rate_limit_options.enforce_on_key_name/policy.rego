package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_rate_limit_options_enforce_on_key_name

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The rate limit key name should identify a reliable HTTP header used to distinguish clients for rate limiting.",
            "remedies": [
                "Set enforce_on_key to HTTP_HEADER and configure enforce_on_key_name to X-Forwarded-For."
            ]
        },
        {
            "condition": "Rate limit key name must be X-Forwarded-For when HTTP_HEADER is used",
            "attribute_path": ["rules", 0, "rate_limit_options", 0, "enforce_on_key_name"],
            "values": ["X-Forwarded-For"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details