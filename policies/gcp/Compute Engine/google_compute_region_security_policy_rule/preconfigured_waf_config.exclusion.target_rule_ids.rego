package terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.preconfigured_waf_config_exclusion_target_rule_ids

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "The preconfigured WAF exclusion is not scoped to specific target rule IDs, which can cause the exclusion to apply across the entire WAF rule set.",
            "remedies": [
                "Specify explicit target_rule_ids so the exclusion applies only to WAF rules that require an exception.",
                "Apply the principle of least privilege when defining WAF exclusions and avoid rule-set-wide exclusions.",
                "Document and periodically review excluded WAF rule IDs to ensure each exception remains operationally necessary."
            ]
        },
        {
            "condition": "Prevent unscoped WAF exclusions that apply without explicitly selected target rule IDs.",
            "attribute_path": [
                "preconfigured_waf_config",
                0,
                "exclusion",
                0,
                "target_rule_ids"
            ],
            "values": [
                []
            ],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
