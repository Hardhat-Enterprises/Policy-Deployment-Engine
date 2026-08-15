package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_url_rewrite_path_prefix_rewrite

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route rewrites the request path to an empty value or a bare '..' before forwarding to the backend. Either can be misused to reach unintended endpoints or bypass path-based access controls.",
            "remedies": [
                "Set rules.action.url_rewrite.path_prefix_rewrite to a specific, well-formed path prefix, or omit it if no rewrite is needed.",
                "Never set path_prefix_rewrite to an empty string or a bare '..'."
            ]
        },
        {
            "condition": "Check that path_prefix_rewrite is not empty or a bare '..'",
            "attribute_path": ["rules", 0, "action", 0, "url_rewrite", 0, "path_prefix_rewrite"],
            "values": ["", ".."],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details