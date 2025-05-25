package terraform.gcp.security.API.Gateway_Config.managed_service_configs

import data.terraform.gcp.helpers
import data.terraform.gcp.security.API.Gateway_Config.managed_service_configs.vars

conditions := [
  [
    {
      "situation_description": "Ensure the API Gateway config uses only approved backend service config files.",
      "remedies": [
        "Use only approved 'service-config.json' as managed_service_config path."
      ]
    },
    {
      "condition": "Disallow any non-whitelisted managed_service_configs path",
      "attribute_path": ["managed_service_configs", 0, "path"],
      "values": ["service-config.json"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

