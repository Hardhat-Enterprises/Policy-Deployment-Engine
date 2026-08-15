package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_response_header_modifier_remove

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's response header modifier removes browser-security-relevant headers before they reach the client. Stripping headers like Content-Security-Policy, Strict-Transport-Security, X-Frame-Options, or X-Content-Type-Options removes real browser-side defenses against XSS, clickjacking, and downgrade attacks.",
            "remedies": [
                "Do not include browser-security headers in rules.action.response_header_modifier.remove.",
                "If a security header genuinely needs to be replaced rather than removed, use response_header_modifier.set instead."
            ]
        },
        {
            "condition": "Check that browser-security headers are not removed from responses",
            "attribute_path": ["rules", 0, "action", 0, "response_header_modifier", 0, "remove"],
            "values": ["Content-Security-Policy", "Strict-Transport-Security", "X-Frame-Options", "X-Content-Type-Options"],
            "policy_type": "element blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details