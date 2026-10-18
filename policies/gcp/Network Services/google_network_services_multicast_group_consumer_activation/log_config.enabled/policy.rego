package terraform.gcp.security.network_services.google_network_services_multicast_group_consumer_activation.log_config_enabled

import data.terraform.helpers as helpers
import data.terraform.gcp.security.network_services.google_network_services_multicast_group_consumer_activation.vars as vars

conditions := [[
  {
    "situation_description": "Multicast Group Consumer Activation logging must be enabled.",
    "remedies": ["Set log_config.enabled = true."],
  },
  {
    "condition": "log_config.enabled must be true.",
    "attribute_path": ["log_config", 0, "enabled"],
    "values": [true],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details