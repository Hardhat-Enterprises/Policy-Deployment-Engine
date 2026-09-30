package terraform.gcp.security.network_services.google_network_services_edge_cache_service.edge_ssl_certificates

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "At least one edge SSL certificate should be attached for client TLS.",
      "remedies": [
        "Attach at least one global EDGE_CACHE SSL certificate."
      ]
    },
    {
      "condition": "At least one edge SSL certificate should be attached for client TLS.",
      "attribute_path": [
        "edge_ssl_certificates"
      ],
      "values": [
        null,
        []
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
