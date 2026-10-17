package terraform.gcp.security.network_services.google_network_services_edge_cache_service.routing_path_matcher_route_rule_url_redirect_https_redirect

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Redirects should use HTTPS.",
      "remedies": [
        "Set https_redirect to true and attach an edge SSL certificate."
      ]
    },
    {
      "condition": "Redirects should use HTTPS.",
      "attribute_path": [
        "routing",
        0,
        "path_matcher",
        0,
        "route_rule",
        0,
        "url_redirect",
        0,
        "https_redirect"
      ],
      "values": [
        true
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
