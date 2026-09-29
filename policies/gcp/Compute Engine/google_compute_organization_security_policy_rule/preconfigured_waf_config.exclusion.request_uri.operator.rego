package terraform.gcp.security.compute_engine.google_compute_organization_security_policy_rule.preconfigured_waf_config_exclusion_request_uri_operator
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_organization_security_policy_rule.vars
conditions := [
    [
        {
            "situation_description": "The WAF exclusion's request_uri operator is set to EQUALS_ANY, exempting the URI field entirely from inspection regardless of value — since URI paths are a common target for injection and traversal attacks, this directly reduces WAF protection coverage.",
            "remedies": [
                "Use a narrower operator (EQUALS, STARTS_WITH, ENDS_WITH, or CONTAINS) with a specific value instead of EQUALS_ANY.",
                "Avoid EQUALS_ANY unless intentionally exempting the URI field entirely.",
                "Consult Google Cloud documentation on preconfigured WAF exclusions for details."
            ]
        },
        {
            "condition": "Check if request_uri operator is set to EQUALS_ANY",
            "attribute_path": ["preconfigured_waf_config", 0, "exclusion", 0, "request_uri", 0, "operator"],
            "values": ["EQUALS_ANY"],
            "policy_type": "Blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
