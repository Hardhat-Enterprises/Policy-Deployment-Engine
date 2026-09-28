package terraform.gcp.security.network_services.google_network_services_edge_cache_service.routing_path_matcher_route_rule_route_action_cdn_policy_signed_token_options_allowed_signature_algorithms

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "HMAC SHA-1 should not be allowed for signed tokens.",
      "remedies": [
        "Remove HMAC_SHA1 and use ED25519 or HMAC_SHA_256."
      ]
    },
    {
      "condition": "HMAC SHA-1 should not be allowed for signed tokens.",
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
        "signed_token_options",
        0,
        "allowed_signature_algorithms"
      ],
      "values": [
        "HMAC_SHA1"
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
