package terraform.gcp.security.network_services.google_network_services_edge_cache_origin.origin_redirect_redirect_conditions

import data.terraform.helpers as helpers
import data.terraform.gcp.security.network_services.google_network_services_edge_cache_origin.vars as vars

conditions := [[
  {
    "situation_description": "Edge Cache Origin should not automatically follow redirects from the origin.",
    "remedies": ["Remove redirect conditions unless redirect following is explicitly required and trusted."],
  },
  {
    "condition": "origin_redirect.redirect_conditions must not enable automatic redirect following.",
    "attribute_path": ["origin_redirect", 0, "redirect_conditions"],
    "values": [
      "MOVED_PERMANENTLY",
      "FOUND",
      "SEE_OTHER",
      "TEMPORARY_REDIRECT",
      "PERMANENT_REDIRECT",
    ],
    "policy_type": "blacklist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details