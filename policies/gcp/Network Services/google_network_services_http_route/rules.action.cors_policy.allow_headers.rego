package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_cors_policy_allow_headers

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's CORS policy allows a wildcard ('*') in allow_headers. This lets cross-origin callers send any request header, which can expose internal or debug headers to untrusted origins.",
            "remedies": [
                "Remove the wildcard '*' entry from rules.action.cors_policy.allow_headers.",
                "List only the specific, approved request headers the route needs (for example Content-Type)."
            ]
        },
        {
            "condition": "Check that no allow_headers entry is a wildcard",
            "attribute_path": ["rules", 0, "action", 0, "cors_policy", 0, "allow_headers"],
            "values": ["*"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details