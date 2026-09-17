package terraform.gcp.security.network_services.google_network_services_edge_cache_origin.deletion_policy

import data.terraform.helpers as helpers
import data.terraform.gcp.security.network_services.google_network_services_edge_cache_origin.vars as vars

conditions := [[
  {
    "situation_description": "Edge Cache Origin must be protected from accidental deletion.",
    "remedies": ["Set deletion_policy = PREVENT."],
  },
  {
    "condition": "deletion_policy must be PREVENT.",
    "attribute_path": ["deletion_policy"],
    "values": ["PREVENT"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details