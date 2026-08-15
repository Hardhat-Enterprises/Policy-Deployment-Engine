package terraform.gcp.security.network_services.google_network_services_http_route.rules_matches_ignore_case

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's match rule uses case-insensitive matching for prefixMatch and fullPathMatch. This can allow requests to bypass rules that rely on exact-case path segments, weakening path-based access controls.",
            "remedies": [
                "Leave rules.matches.ignore_case unset or set it to false so path matching remains case-sensitive.",
                "If case-insensitive matching is genuinely required, confirm no security-relevant routing decisions depend on path casing."
            ]
        },
        {
            "condition": "Check that ignore_case is not enabled without review",
            "attribute_path": ["rules", 0, "matches", 0, "ignore_case"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details