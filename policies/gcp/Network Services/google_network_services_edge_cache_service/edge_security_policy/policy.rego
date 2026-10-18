package terraform.gcp.security.network_services.google_network_services_edge_cache_service.edge_security_policy

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "A Cloud Armor edge security policy should be attached to requests.",
      "remedies": [
        "Attach a valid Cloud Armor edge security policy to the service."
      ]
    },
    {
      "condition": "A Cloud Armor edge security policy should be attached to requests.",
      "attribute_path": [
        "edge_security_policy"
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
