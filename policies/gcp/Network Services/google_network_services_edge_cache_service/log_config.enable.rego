package terraform.gcp.security.network_services.google_network_services_edge_cache_service.log_config_enable

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Traffic logging should be enabled.",
      "remedies": [
        "Set log_config.enable to true."
      ]
    },
    {
      "condition": "Traffic logging should be enabled.",
      "attribute_path": [
        "log_config",
        0,
        "enable"
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
