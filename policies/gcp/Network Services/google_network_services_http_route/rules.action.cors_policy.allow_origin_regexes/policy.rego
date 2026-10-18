package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_cors_policy_allow_origin_regexes

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's CORS policy uses an origin regex that is not fully anchored (it does not start with '^' and end with '$'). A loosely anchored regex can match attacker-controlled domains that merely contain the intended origin, defeating the purpose of the CORS restriction.",
            "remedies": [
                "Anchor every entry in rules.action.cors_policy.allow_origin_regexes with '^' at the start and '$' at the end.",
                "Review each regex so it matches only the approved origins, for example ^https://app\\.example\\.com$."
            ]
        },
        {
            "condition": "Check that every allow_origin_regexes entry is fully anchored",
            "attribute_path": ["rules", 0, "action", 0, "cors_policy", 0, "allow_origin_regexes"],
            "values": ["^*$", "^*://*$"],
            "policy_type": "element pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details