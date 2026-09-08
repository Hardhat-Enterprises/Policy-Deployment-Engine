package terraform.gcp.security.compute_engine.google_compute_security_policy.rule_preconfigured_waf_config_exclusion_request_cookie_operator
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "A WAF exclusion matches every cookie regardless of name, exempting all cookies from injection and scripting checks rather than the single cookie the exception was intended for.",
    "remedies":[ "Use a specific operator such as EQUALS with a named cookie value instead of matching any cookie."]},
    {
        "condition": "The request cookie exclusion operator must not match every cookie.",
        "attribute_path" : ["rule", 0, "preconfigured_waf_config", 0, "exclusion", 0, "request_cookie", 0, "operator"],
        "values" : ["EQUALS_ANY"],
        "policy_type" : "blacklist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details