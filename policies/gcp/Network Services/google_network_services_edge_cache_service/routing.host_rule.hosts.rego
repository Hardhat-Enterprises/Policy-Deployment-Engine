package terraform.gcp.security.network_services.google_network_services_edge_cache_service.routing_host_rule_hosts

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "The host rule should not use the unrestricted star host.",
      "remedies": [
        "Replace the star host with the hostnames this service is meant to serve."
      ]
    },
    {
      "condition": "The host rule should not use the unrestricted star host.",
      "attribute_path": [
        "routing",
        0,
        "host_rule",
        0,
        "hosts"
      ],
      "values": [
        "*"
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
