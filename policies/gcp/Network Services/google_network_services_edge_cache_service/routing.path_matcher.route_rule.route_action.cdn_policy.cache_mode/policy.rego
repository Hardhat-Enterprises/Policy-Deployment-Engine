package terraform.gcp.security.network_services.google_network_services_edge_cache_service.routing_path_matcher_route_rule_route_action_cdn_policy_cache_mode

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Force caching should not override the origin's cache intent.",
      "remedies": [
        "Use a cache mode that respects the origin's caching decision."
      ]
    },
    {
      "condition": "Force caching should not override the origin's cache intent.",
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
        "cache_mode"
      ],
      "values": [
        "FORCE_CACHE_ALL"
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
