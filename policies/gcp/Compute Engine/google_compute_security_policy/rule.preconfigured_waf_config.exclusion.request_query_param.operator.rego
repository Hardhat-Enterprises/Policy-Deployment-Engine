package terraform.gcp.security.compute_engine.google_compute_security_policy.rule_preconfigured_waf_config_exclusion_request_query_param_operator
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "A WAF exclusion matches every query parameter regardless of name, disabling injection detection across all user input since query parameters and POST body fields are the most common carriers of injection payloads.",
    "remedies":[ "Use a specific operator such as EQUALS with a named parameter instead of matching any parameter."]},
    {
        "condition": "The query parameter exclusion operator must not match every parameter.",
        "attribute_path" : ["rule", 0, "preconfigured_waf_config", 0, "exclusion", 0, "request_query_param", 0, "operator"],
        "values" : ["EQUALS_ANY"],
        "policy_type" : "blacklist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details