package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_rate_limit_options_exceed_action

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The rate limit exceed action should use HTTP 429 to clearly indicate that the request was rejected because the configured rate limit was exceeded.",
            "remedies": [
                "Set exceed_action to deny(429) for rate limit violations."
            ]
        },
        {
            "condition": "Rate limit exceed action must be deny(429)",
            "attribute_path": ["rules", 0, "rate_limit_options", 0, "exceed_action"],
            "values": ["deny(429)"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details