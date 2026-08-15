package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_cors_policy_disabled

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's CORS policy is disabled. This removes all origin and credential restrictions configured elsewhere in the CORS policy, effectively allowing unrestricted cross-origin access to this route.",
            "remedies": [
                "Leave rules.action.cors_policy.disabled unset or set it to false so the configured CORS restrictions remain in effect.",
                "If CORS enforcement is genuinely not needed for this route, confirm this is intentional and reviewed."
            ]
        },
        {
            "condition": "Check that the CORS policy is not disabled without review",
            "attribute_path": ["rules", 0, "action", 0, "cors_policy", 0, "disabled"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details