package terraform.gcp.security.compute_engine.google_compute_security_policy.rule_preconfigured_waf_config_exclusion_request_header_operator
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "A WAF exclusion matches every request header regardless of name, removing all headers from preconfigured WAF evaluation even though headers commonly carry attacker-controlled input.",
    "remedies":[ "Use a specific operator such as EQUALS with a named header instead of matching any header."]},
    {
        "condition": "The request header exclusion operator must not match every header.",
        "attribute_path" : ["rule", 0, "preconfigured_waf_config", 0, "exclusion", 0, "request_header", 0, "operator"],
        "values" : ["EQUALS_ANY"],
        "policy_type" : "blacklist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details