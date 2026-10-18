package terraform.gcp.security.compute_engine.google_compute_security_policy.rule_preconfigured_waf_config_exclusion_request_uri_operator
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "A WAF exclusion matches every request path, exempting the entire application from the targeted WAF rule set rather than the single path the exception was intended for.",
    "remedies":[ "Use a specific operator such as EQUALS with a named path instead of matching any URI."]},
    {
        "condition": "The request URI exclusion operator must not match every path.",
        "attribute_path" : ["rule", 0, "preconfigured_waf_config", 0, "exclusion", 0, "request_uri", 0, "operator"],
        "values" : ["EQUALS_ANY"],
        "policy_type" : "blacklist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details