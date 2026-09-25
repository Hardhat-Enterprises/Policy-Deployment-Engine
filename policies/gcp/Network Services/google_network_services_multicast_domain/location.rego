package terraform.gcp.security.network_services.google_network_services_multicast_domain.location

import data.terraform.helpers as helpers
import data.terraform.gcp.security.network_services.google_network_services_multicast_domain.vars as vars

conditions := [[
  {
    "situation_description": "Multicast Domain must be deployed in the approved location.",
    "remedies": ["Set location = global."],
  },
  {
    "condition": "location must be global.",
    "attribute_path": ["location"],
    "values": ["global"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details