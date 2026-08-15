package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_cors_policy_allow_credentials

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's CORS policy allows credentials to be included in cross-origin requests. This expands the attack surface for cross-origin credential theft and must be paired with a tightly scoped allow_origins/allow_origin_regexes list, never a wildcard origin.",
            "remedies": [
                "Confirm allow_origins/allow_origin_regexes for this route is restricted to specific, trusted origins before allowing credentials.",
                "If credentials are not required by the client application, set allow_credentials to false."
            ]
        },
        {
            "condition": "Check that allow_credentials is not enabled without review",
            "attribute_path": ["rules", 0, "action", 0, "cors_policy", 0, "allow_credentials"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details