package terraform.gcp.security.compute_engine.google_compute_security_policy_rule.preconfigured_waf_config_exclusion_request_uri_operator

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "The security policy rule uses an unrestricted URI exclusion that can cause matching request URIs to bypass preconfigured WAF inspection.",
            "remedies": [
                "Replace EQUALS_ANY with a narrowly scoped URI exclusion operator.",
                "Prefer EQUALS where an exact known URI value can be excluded safely.",
                "Use STARTS_WITH, ENDS_WITH, or CONTAINS only when a broader match is explicitly required and has been security reviewed.",
                "Periodically review WAF exclusions and remove exceptions that are no longer operationally required."
            ]
        },
        {
            "condition": "Prevent unrestricted URI exclusions from bypassing preconfigured WAF inspection.",
            "attribute_path": [
                "preconfigured_waf_config",
                0,
                "exclusion",
                0,
                "request_uri",
                0,
                "operator"
            ],
            "values": ["EQUALS_ANY"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details