package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_preconfigured_waf_config_exclusion_request_header_operator

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The preconfigured WAF exclusion uses an overly broad request header operator.",
            "remedies": [
                "Use a specific request header operator such as EQUALS instead of EQUALS_ANY."
            ]
        },
        {
            "condition": "Request header exclusion operator must not allow any value",
            "attribute_path": ["rules", 0, "preconfigured_waf_config", 0, "exclusion", 0, "request_header", 0, "operator"],
            "values": ["EQUALS"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details