package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_rate_limit_options_enforce_on_key_configs_enforce_on_key_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "Rate limiting should be enforced separately for each source IP address to prevent one client from affecting other clients.",
            "remedies": [
                "Set enforce_on_key_type to IP so each source IP has its own rate limit."
            ]
        },
        {
            "condition": "Rate limit key type must be IP",
            "attribute_path": ["rules", 0, "rate_limit_options", 0, "enforce_on_key_configs", 0, "enforce_on_key_type"],
            "values": ["IP"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details