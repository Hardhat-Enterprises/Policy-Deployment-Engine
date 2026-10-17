package terraform.gcp.security.network_services.google_network_services_agent_gateway.google_managed_governed_access_path

import data.terraform.helpers as helpers
import data.terraform.gcp.security.network_services.google_network_services_agent_gateway.vars as vars

conditions := [[
  {
    "situation_description": "Agent Gateway must use an approved governed access path.",
    "remedies": ["Set google_managed.governed_access_path = CLIENT_TO_AGENT."],
  },
  {
    "condition": "google_managed.governed_access_path must be CLIENT_TO_AGENT.",
    "attribute_path": ["google_managed", 0, "governed_access_path"],
    "values": ["CLIENT_TO_AGENT"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details