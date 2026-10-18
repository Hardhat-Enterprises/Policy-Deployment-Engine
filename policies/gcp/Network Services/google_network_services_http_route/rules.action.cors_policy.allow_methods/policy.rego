package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_cors_policy_allow_methods

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's CORS policy allows cross-origin methods beyond GET, HEAD and OPTIONS. Allowing state-changing methods such as PUT, POST, PATCH or DELETE cross-origin widens the CORS attack surface for requests that modify data.",
            "remedies": [
                "Restrict rules.action.cors_policy.allow_methods to GET, HEAD and OPTIONS.",
                "If a state-changing method is genuinely required cross-origin, confirm the route has additional protection (authentication and CSRF controls) before allowing it."
            ]
        },
        {
            "condition": "Check that allow_methods contains only GET, HEAD or OPTIONS",
            "attribute_path": ["rules", 0, "action", 0, "cors_policy", 0, "allow_methods"],
            "values": ["GET", "HEAD", "OPTIONS"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details