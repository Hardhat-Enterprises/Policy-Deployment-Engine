package terraform.gcp.security.compute_engine.google_compute_organization_security_policy_rule.preconfigured_waf_config_exclusion_target_rule_set
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_organization_security_policy_rule.vars
conditions := [
    [
        {
            "situation_description": "The WAF exclusion's target_rule_set is left empty, meaning the exclusion scope is undefined and potentially applies too broadly.",
            "remedies": [
                "Explicitly specify a valid target_rule_set for the WAF exclusion.",
                "Avoid leaving target_rule_set empty or unset.",
                "Consult Google Cloud documentation on preconfigured WAF rule sets for details."
            ]
        },
        {
            "condition": "Check if target_rule_set is empty",
            "attribute_path": ["preconfigured_waf_config", 0, "exclusion", 0, "target_rule_set"],
            "values": [""],
            "policy_type": "Blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
