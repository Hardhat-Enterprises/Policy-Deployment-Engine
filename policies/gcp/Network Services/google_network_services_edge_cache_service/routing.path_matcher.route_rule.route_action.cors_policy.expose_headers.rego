package terraform.gcp.security.network_services.google_network_services_edge_cache_service.routing_path_matcher_route_rule_route_action_cors_policy_expose_headers

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "CORS response headers should not all be exposed to browser code.",
      "remedies": [
        "List only the response headers browser code needs to read."
      ]
    },
    {
      "condition": "CORS response headers should not all be exposed to browser code.",
      "attribute_path": [
        "routing",
        0,
        "path_matcher",
        0,
        "route_rule",
        0,
        "route_action",
        0,
        "cors_policy",
        0,
        "expose_headers"
      ],
      "values": [
        "*"
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
