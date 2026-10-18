package terraform.gcp.security.compute_engine.google_compute_security_policy_rule.rate_limit_options_exceed_redirect_options_target

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "The rate-limit exceed redirect target uses an insecure HTTP URL, which can expose redirected traffic to interception or modification in transit.",
            "remedies": [
                "Use an HTTPS URL for the exceed redirect target.",
                "Avoid redirecting clients to unencrypted HTTP endpoints."
            ]
        },
        {
            "condition": "Require the rate-limit exceed redirect target to use HTTPS.",
            "attribute_path": [
                "rate_limit_options",
                0,
                "exceed_redirect_options",
                0,
                "target"
            ],
            "values": ["*://", [["https"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details