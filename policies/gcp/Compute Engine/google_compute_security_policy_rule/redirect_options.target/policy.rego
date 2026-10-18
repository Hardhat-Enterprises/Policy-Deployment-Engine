package terraform.gcp.security.compute_engine.google_compute_security_policy_rule.redirect_options_target

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "The redirect target uses an insecure HTTP URL, which can expose redirected traffic to interception or modification in transit.",
            "remedies": [
                "Use an HTTPS URL for the redirect target.",
                "Avoid redirecting clients to unencrypted HTTP endpoints."
            ]
        },
        {
            "condition": "Require the redirect target to use HTTPS.",
            "attribute_path": [
                "redirect_options",
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