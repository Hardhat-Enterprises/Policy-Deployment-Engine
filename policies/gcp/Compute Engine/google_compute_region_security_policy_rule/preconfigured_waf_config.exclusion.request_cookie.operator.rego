package terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.preconfigured_waf_config_exclusion_request_cookie_operator

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "The regional security policy rule uses an unrestricted cookie exclusion that can cause any value of the targeted cookie to bypass preconfigured WAF inspection.",
            "remedies": [
                "Replace EQUALS_ANY with a narrowly scoped cookie exclusion operator.",
                "Prefer EQUALS where an exact known cookie value can be excluded safely.",
                "Use STARTS_WITH, ENDS_WITH, or CONTAINS only when a broader match is explicitly required and has been security reviewed.",
                "Periodically review WAF exclusions and remove exceptions that are no longer operationally required."
            ]
        },
        {
            "condition": "Prevent unrestricted cookie-value exclusions from bypassing preconfigured WAF inspection.",
            "attribute_path": [
                "preconfigured_waf_config",
                0,
                "exclusion",
                0,
                "request_cookie",
                0,
                "operator"
            ],
            "values": ["EQUALS_ANY"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details