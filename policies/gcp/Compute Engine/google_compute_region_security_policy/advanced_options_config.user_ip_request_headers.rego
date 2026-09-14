package terraform.gcp.security.compute_engine.google_compute_region_security_policy.advanced_options_config_user_ip_request_headers

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The security policy trusts an unapproved header for resolving the original client IP address.",
            "remedies": [
                "Use the approved X-Forwarded-For header for client IP resolution."
            ]
        },
        {
            "condition": "User IP request headers must contain only X-Forwarded-For",
            "attribute_path": ["advanced_options_config", 0, "user_ip_request_headers"],
            "values": ["X-Forwarded-For"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details