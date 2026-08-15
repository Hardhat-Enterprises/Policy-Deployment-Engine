package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_url_rewrite_host_rewrite

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route rewrites the Host header to a known-dangerous value before forwarding the request to the backend. Pointing host_rewrite at a cloud metadata endpoint, localhost, or an empty value can enable SSRF-style abuse or host-header confusion at the backend.",
            "remedies": [
                "Set rules.action.url_rewrite.host_rewrite to a specific, trusted backend hostname, or omit it if no rewrite is needed.",
                "Never point host_rewrite at cloud metadata endpoints (e.g. 169.254.169.254, metadata.google.internal) or localhost."
            ]
        },
        {
            "condition": "Check that host_rewrite is not set to a known-dangerous value",
            "attribute_path": ["rules", 0, "action", 0, "url_rewrite", 0, "host_rewrite"],
            "values": ["", "169.254.169.254", "metadata.google.internal", "localhost"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details