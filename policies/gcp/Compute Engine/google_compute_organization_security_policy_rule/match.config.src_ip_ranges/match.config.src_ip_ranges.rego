package terraform.gcp.security.compute_engine.google_compute_organization_security_policy_rule.match_config_src_ip_ranges
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_organization_security_policy_rule.vars
conditions := [
    [
        {
            "situation_description": "The rule's src_ip_ranges is set to an overly broad CIDR range (0.0.0.0/0), directly widening which traffic the rule's action applies to.",
            "remedies": [
                "Scope src_ip_ranges to the minimum necessary CIDR range(s) for this rule.",
                "Avoid 0.0.0.0/0 unless the rule is intentionally meant to match all traffic.",
                "Consult Google Cloud documentation on organization security policy rule matching for details."
            ]
        },
        {
            "condition": "Check if src_ip_ranges contains the overly broad 0.0.0.0/0 range",
            "attribute_path": ["match", 0, "config", 0, "src_ip_ranges"],
            "values": ["0.0.0.0/0"],
            "policy_type": "Blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
