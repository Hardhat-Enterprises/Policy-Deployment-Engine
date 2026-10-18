package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_preconfigured_waf_config_exclusion_target_rule_set

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The preconfigured WAF exclusion targets an unapproved WAF rule set.",
            "remedies": [
                "Restrict rules.preconfigured_waf_config.exclusion.target_rule_set to approved WAF rule sets, such as owasp-crs-v030001."
            ]
        },
        {
            "condition": "Target WAF rule set must be restricted to approved rule sets",
            "attribute_path": ["rules", 0, "preconfigured_waf_config", 0, "exclusion", 0, "target_rule_set"],
            "values": ["owasp-crs-v030001"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details