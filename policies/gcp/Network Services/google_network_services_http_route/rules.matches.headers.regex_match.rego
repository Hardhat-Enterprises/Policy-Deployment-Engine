package terraform.gcp.security.network_services.google_network_services_http_route.rules_matches_headers_regex_match

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route matches a request header using a regex that is not fully anchored (it does not start with '^' and end with '$'). A loosely anchored header regex can match unintended values, letting requests bypass header-based routing rules in the same way as an unanchored path regex.",
            "remedies": [
                "Anchor rules.matches.headers.regex_match with '^' at the start and '$' at the end.",
                "Review the regex so it matches only the approved header values."
            ]
        },
        {
            "condition": "Check that headers.regex_match is fully anchored",
            "attribute_path": ["rules", 0, "matches", 0, "headers", 0, "regex_match"],
            "values": ["^*$"],
            "policy_type": "element pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details