package terraform.gcp.security.compute_engine.google_compute_security_policy.advanced_options_config_user_ip_request_headers
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "A request header that any client can set is trusted for resolving the caller's IP address, so an attacker can forge their apparent source address and bypass IP-based allow and deny rules as well as per-client rate limiting.",
    "remedies":[ "Remove client-controllable headers such as X-Forwarded-For from user_ip_request_headers and trust only headers written by a controlled proxy."]},
    {
        "condition": "user_ip_request_headers must not trust headers that a client can set freely.",
        "attribute_path" : ["advanced_options_config", 0, "user_ip_request_headers"],
        "values" : ["X-Forwarded-For"],
        "policy_type" : "element blacklist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details