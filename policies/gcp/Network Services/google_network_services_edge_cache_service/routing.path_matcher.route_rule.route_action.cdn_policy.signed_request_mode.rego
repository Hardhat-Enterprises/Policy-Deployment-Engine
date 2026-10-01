package terraform.gcp.security.network_services.google_network_services_edge_cache_service.routing_path_matcher_route_rule_route_action_cdn_policy_signed_request_mode

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Signed requests should be enforced on this protected route.",
      "remedies": [
        "Require signatures or tokens for a route that serves protected content."
      ]
    },
    {
      "condition": "Signed requests should be enforced on this protected route.",
      "attribute_path": [
        "routing",
        0,
        "path_matcher",
        0,
        "route_rule",
        0,
        "route_action",
        0,
        "cdn_policy",
        0,
        "signed_request_mode"
      ],
      "values": [
        "DISABLED",
        null
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
