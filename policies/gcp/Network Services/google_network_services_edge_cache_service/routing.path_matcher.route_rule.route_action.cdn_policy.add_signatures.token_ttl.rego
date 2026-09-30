package terraform.gcp.security.network_services.google_network_services_edge_cache_service.routing_path_matcher_route_rule_route_action_cdn_policy_add_signatures_token_ttl

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Generated tokens should expire within one day.",
      "remedies": [
        "Set token_ttl to no more than 86400s (one day)."
      ]
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

# Terraform plans store token_ttl as a duration string such as "3600s". Convert
# valid seconds durations to numbers before applying the shared numeric range rule.
# The provider validates the duration format and the one-week absolute ceiling.
duration_patches := [patch |
  some i
  resource := input.planned_values.root_module.resources[i]
  resource.type == vars.variables.resource_type
  duration := resource.values.routing[0].path_matcher[0].route_rule[0].route_action[0].cdn_policy[0].add_signatures[0].token_ttl
  is_string(duration)
  endswith(duration, "s")
  seconds := to_number(trim_suffix(duration, "s"))
  patch := {
    "op": "replace",
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
