package terraform.gcp.security.network_services.google_network_services_multicast_group_consumer_activation.location

import data.terraform.helpers as helpers
import data.terraform.gcp.security.network_services.google_network_services_multicast_group_consumer_activation.vars as vars

conditions := [[
  {
    "situation_description": "Multicast Group Consumer Activation must be deployed in an approved location.",
    "remedies": ["Deploy the resource in australia-southeast1-b."],
  },
  {
    "condition": "location must be an approved location.",
    "attribute_path": ["location"],
    "values": ["australia-southeast1-b"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details