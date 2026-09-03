package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_preconfigured_waf_config_exclusion_request_cookie_operator

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The preconfigured WAF exclusion uses an overly broad request cookie operator.",
            "remedies": [
                "Restrict rules.preconfigured_waf_config.exclusion.request_cookie.operator to specific matching operators such as EQUALS, STARTS_WITH, ENDS_WITH, or CONTAINS."
            ]
        },
        {
            "condition": "Request cookie exclusion operator must not use EQUALS_ANY",
            "attribute_path": ["rules", 0, "preconfigured_waf_config", 0, "exclusion", 0, "request_cookie", 0, "operator"],
            "values": ["EQUALS", "STARTS_WITH", "ENDS_WITH", "CONTAINS"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details