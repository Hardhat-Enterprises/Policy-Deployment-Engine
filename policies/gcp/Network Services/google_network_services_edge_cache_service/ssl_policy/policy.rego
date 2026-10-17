package terraform.gcp.security.network_services.google_network_services_edge_cache_service.ssl_policy

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "An explicit SSL policy should replace the default COMPATIBLE profile.",
      "remedies": [
        "Attach an explicit SSL policy that meets the organisation's TLS baseline."
      ]
    },
    {
      "condition": "An explicit SSL policy should replace the default COMPATIBLE profile.",
      "attribute_path": [
        "ssl_policy"
      ],
      "values": [
        null,
        ""
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
