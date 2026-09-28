package terraform.gcp.security.network_services.google_network_services_edge_cache_service.routing_path_matcher_route_rule_route_action_cdn_policy_add_signatures_token_ttl

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "The maximum one-week generated-token lifetime should be avoided.",
      "remedies": [
        "Reduce the generated-token lifetime below the one-week maximum."
      ]
    },
    {
      "condition": "The maximum one-week generated-token lifetime should be avoided.",
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
        "add_signatures",
        0,
        "token_ttl"
      ],
      "values": [
        "604800s"
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
