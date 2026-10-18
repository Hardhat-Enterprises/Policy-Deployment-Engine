package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_cors_policy_allow_credentials

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's CORS policy allows credentialed cross-origin requests (allow_credentials = true) while also allowing a wildcard origin ('*') in allow_origins. Together these let any website make authenticated cross-origin requests to this route, which can expose user data to cross-origin theft.",
            "remedies": [
                "Replace the wildcard '*' in rules.action.cors_policy.allow_origins with the specific, approved origins that need credentialed access.",
                "If credentialed cross-origin requests are not needed, set rules.action.cors_policy.allow_credentials to false."
            ],
            "match": "all"
        },
        {
            "condition": "allow_credentials is true",
            "attribute_path": ["rules", 0, "action", 0, "cors_policy", 0, "allow_credentials"],
            "values": [true],
            "policy_type": "blacklist"
        },
        {
            "condition": "allow_origins contains a wildcard",
            "attribute_path": ["rules", 0, "action", 0, "cors_policy", 0, "allow_origins"],
            "values": ["*"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details