package terraform.gcp.security.compute_engine.google_compute_security_policy.advanced_options_config_request_body_inspection_size
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "The WAF inspects only a small portion of each request body, so an attacker can pad a request and place an exploit beyond the inspection limit where it will never be examined.",
    "remedies":[ "Set advanced_options_config.request_body_inspection_size to 64KB so the largest supported portion of each request body is inspected."]},
    {
        "condition": "request_body_inspection_size must be the maximum supported size so payloads cannot be hidden past the cutoff.",
        "attribute_path" : ["advanced_options_config", 0, "request_body_inspection_size"],
        "values" : ["64KB"],
        "policy_type" : "whitelist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details