package terraform.gcp.security.network_services.google_network_services_edge_cache_service.routing_path_matcher_route_rule_route_action_cdn_policy_add_signatures_token_ttl

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Generated tokens should expire within one day.",
      "remedies": [
        "Set token_ttl to no more than 86400s (one day)."
      ],
      "match": "all"
    },
    {
      "condition": "Signed-token generation is configured.",
      "attribute_path": [
        "routing", 0, "path_matcher", 0, "route_rule", 0,
        "route_action", 0, "cdn_policy", 0, "add_signatures", 0, "actions"
      ],
      "values": ["GENERATE_COOKIE", "GENERATE_TOKEN_HLS_COOKIELESS"],
      "policy_type": "blacklist"
    },
    {
      "condition": "Generated tokens should expire within one day.",
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
        0,
        86400
      ],
      "policy_type": "range"
    }
  ]
]

# Terraform stores durations as strings. The provider defaults an omitted
# token_ttl to 86400s; absent add_signatures needs no lifetime check.
ttl_seconds(raw) := seconds if {
  is_string(raw)
  endswith(raw, "s")
  seconds := to_number(trim_suffix(raw, "s"))
}
ttl_seconds(raw) := 86400 if {
  raw == null
}

duration_patches := [patch |
  some i
  resource := input.planned_values.root_module.resources[i]
  resource.type == vars.variables.resource_type
  signatures := resource.values.routing[0].path_matcher[0].route_rule[0].route_action[0].cdn_policy[0].add_signatures[0]
  raw := object.get(signatures, "token_ttl", null)
  seconds := ttl_seconds(raw)
  patch := {
    "op": "add",
    "path": sprintf("/planned_values/root_module/resources/%d/values/routing/0/path_matcher/0/route_rule/0/route_action/0/cdn_policy/0/add_signatures/0/token_ttl", [i]),
    "value": seconds
  }
]

numeric_input := json.patch(input, duration_patches)
result := summary if {
  summary := helpers.get_multi_summary(conditions, vars.variables) with input as numeric_input
}
message := result.message
details := result.details
