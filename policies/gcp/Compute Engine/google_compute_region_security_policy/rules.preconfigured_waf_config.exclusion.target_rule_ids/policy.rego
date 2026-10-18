package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_preconfigured_waf_config_exclusion_target_rule_ids

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The preconfigured WAF exclusion does not restrict the exclusion to specific target rule IDs.",
            "remedies": [
                "Specify only the required target_rule_ids under the preconfigured WAF exclusion."
            ]
        },
        {
            "condition": "Preconfigured WAF exclusions must specify target rule IDs",
            "attribute_path": ["rules", 0, "preconfigured_waf_config", 0, "exclusion", 0, "target_rule_ids"],
            "values": ["owasp-crs-v030001-id942100-sqli"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details