package terraform.gcp.security.network_services.google_network_services_authz_extension.fail_open

import data.terraform.helpers as helpers
import data.terraform.gcp.security.network_services.google_network_services_authz_extension.vars as vars

conditions := [[
  {
    "situation_description": "Authz Extension must fail closed when the authorization service fails.",
    "remedies": ["Set fail_open = false."],
  },
  {
    "condition": "fail_open must be false.",
    "attribute_path": ["fail_open"],
    "values": [false],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details