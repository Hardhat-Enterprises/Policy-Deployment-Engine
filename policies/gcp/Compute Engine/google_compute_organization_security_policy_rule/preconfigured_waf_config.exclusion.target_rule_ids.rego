package terraform.gcp.security.compute_engine.google_compute_organization_security_policy_rule.preconfigured_waf_config_exclusion_target_rule_ids
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_organization_security_policy_rule.vars
conditions := [
    [
        {
            "situation_description": "The WAF exclusion's target_rule_ids is omitted, which defaults to excluding all rule IDs under the rule set, significantly reducing WAF protection coverage.",
            "remedies": [
                "Explicitly specify target_rule_ids with the minimum necessary set of rule IDs to exclude.",
                "Avoid omitting target_rule_ids unless intentionally excluding the entire rule set.",
                "Consult Google Cloud documentation on preconfigured WAF exclusions for details."
            ]
        },
        {
            "condition": "Check if target_rule_ids is missing or empty, defaulting to excluding all rule IDs",
            "attribute_path": ["preconfigured_waf_config", 0, "exclusion", 0, "target_rule_ids"],
            "values": [[]],
            "policy_type": "Blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
