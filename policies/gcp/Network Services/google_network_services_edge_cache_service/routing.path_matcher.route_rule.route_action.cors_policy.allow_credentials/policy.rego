package terraform.gcp.security.network_services.google_network_services_edge_cache_service.routing_path_matcher_route_rule_route_action_cors_policy_allow_credentials

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Cross-origin browser requests should not include credentials by default.",
      "remedies": [
        "Set allow_credentials to false unless the cross-origin flow is explicitly approved."
      ]
    },
    {
      "condition": "Cross-origin browser requests should not include credentials by default.",
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
        "allow_credentials"
      ],
      "values": [
        true
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
