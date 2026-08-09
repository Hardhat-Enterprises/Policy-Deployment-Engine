package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_cors_policy_allow_origins

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's CORS policy allows a wildcard origin ('*') in allow_origins. This permits any website to make cross-origin requests to this route; combined with credentialed requests, this is a well-known CORS misconfiguration that can expose the service to cross-origin data theft.",
            "remedies": [
                "Remove the wildcard '*' entry from rules.action.cors_policy.allow_origins.",
                "List only the specific, approved origins that should be allowed to make cross-origin requests to this route."
            ]
        },
        {
            "condition": "Check that no allow_origins entry is a wildcard",
            "attribute_path": ["rules", 0, "action", 0, "cors_policy", 0, "allow_origins"],
            "values": ["*"],
            "policy_type": "element blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details