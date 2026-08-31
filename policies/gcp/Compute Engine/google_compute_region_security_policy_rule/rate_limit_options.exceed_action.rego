package terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.rate_limit_options_exceed_action

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "The regional security policy rule does not use the approved response when traffic exceeds the configured rate limit.",
            "remedies": [
                "Set rate_limit_options.exceed_action to deny(429).",
                "Use HTTP 429 Too Many Requests for traffic rejected because a rate limit has been exceeded.",
                "Review rate-limit response behaviour as part of the organisation's DDoS and abuse-mitigation baseline."
            ]
        },
        {
            "condition": "Require the approved denial response for requests that exceed the configured rate limit.",
            "attribute_path": [
                "rate_limit_options",
                0,
                "exceed_action"
            ],
            "values": [
                "deny(429)"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details