package terraform.gcp.security.network_services.google_network_services_authz_extension.location

import data.terraform.helpers as helpers
import data.terraform.gcp.security.network_services.google_network_services_authz_extension.vars as vars

conditions := [[
  {
    "situation_description": "Authz Extension must be deployed in an approved region.",
    "remedies": ["Deploy the Authz Extension in australia-southeast1."],
  },
  {
    "condition": "location must be an approved region.",
    "attribute_path": ["location"],
    "values": ["australia-southeast1"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details