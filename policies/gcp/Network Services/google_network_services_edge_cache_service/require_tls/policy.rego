package terraform.gcp.security.network_services.google_network_services_edge_cache_service.require_tls

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Clients should be required to use TLS.",
      "remedies": [
        "Set require_tls to true and attach an edge SSL certificate."
      ]
    },
    {
      "condition": "Clients should be required to use TLS.",
      "attribute_path": [
        "require_tls"
      ],
      "values": [
        false,
        null
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
