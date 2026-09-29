package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_cors_policy_expose_headers

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's CORS policy exposes a sensitive response header (Authorization or Set-Cookie) to cross-origin JavaScript. This can leak internal tokens or session data to untrusted origins.",
            "remedies": [
                "Remove Authorization and Set-Cookie from rules.action.cors_policy.expose_headers.",
                "Expose only the non-sensitive response headers that cross-origin clients genuinely need to read."
            ]
        },
        {
            "condition": "Check that expose_headers does not include a sensitive header",
            "attribute_path": ["rules", 0, "action", 0, "cors_policy", 0, "expose_headers"],
            "values": ["Authorization", "Set-Cookie"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details