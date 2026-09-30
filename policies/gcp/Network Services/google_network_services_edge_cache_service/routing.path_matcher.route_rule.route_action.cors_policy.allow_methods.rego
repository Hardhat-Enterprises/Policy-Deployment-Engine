package terraform.gcp.security.network_services.google_network_services_edge_cache_service.routing_path_matcher_route_rule_route_action_cors_policy_allow_methods

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "CORS methods should not allow every method or unnecessary write methods.",
      "remedies": [
        "Remove the wildcard and unnecessary write methods from allow_methods."
      ]
    },
    {
      "condition": "CORS methods should not allow every method or unnecessary write methods.",
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
        "allow_methods"
      ],
      "values": [
        "*",
        "PUT",
        "DELETE",
        "PATCH"
      ],
      "policy_type": "element blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
