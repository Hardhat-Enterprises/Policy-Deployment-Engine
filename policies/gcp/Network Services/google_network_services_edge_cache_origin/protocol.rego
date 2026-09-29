package terraform.gcp.security.network_services.google_network_services_edge_cache_origin.protocol

import data.terraform.helpers as helpers
import data.terraform.gcp.security.network_services.google_network_services_edge_cache_origin.vars as vars

conditions := [[
  {
    "situation_description": "Edge Cache Origin connections must use an encrypted protocol.",
    "remedies": ["Set protocol to HTTPS or HTTP2."],
  },
  {
    "condition": "protocol must use HTTPS or HTTP2.",
    "attribute_path": ["protocol"],
    "values": ["HTTPS", "HTTP2"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details