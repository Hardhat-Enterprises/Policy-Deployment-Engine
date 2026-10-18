package terraform.gcp.security.compute_engine.google_compute_organization_security_policy_rule.preconfigured_waf_config_exclusion_request_query_param_operator
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_organization_security_policy_rule.vars
conditions := [
    [
        {
            "situation_description": "The WAF exclusion's request_query_param operator is set to EQUALS_ANY, exempting the query parameter field entirely from inspection regardless of value, directly widening exclusion scope.",
            "remedies": [
                "Use a narrower operator (EQUALS, STARTS_WITH, ENDS_WITH, or CONTAINS) with a specific value instead of EQUALS_ANY.",
                "Avoid EQUALS_ANY unless intentionally exempting the query parameter field entirely.",
                "Consult Google Cloud documentation on preconfigured WAF exclusions for details."
            ]
        },
        {
            "condition": "Check if request_query_param operator is set to EQUALS_ANY",
            "attribute_path": ["preconfigured_waf_config", 0, "exclusion", 0, "request_query_param", 0, "operator"],
            "values": ["EQUALS_ANY"],
            "policy_type": "Blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
