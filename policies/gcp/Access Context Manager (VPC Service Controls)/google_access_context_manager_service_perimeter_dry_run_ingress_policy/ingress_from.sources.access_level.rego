package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.ingress_from_sources_access_level

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.vars as vars

conditions := [[
  {
    "situation_description": "Ingress sources should use explicitly constrained access levels instead of allowing all ingress sources.",
    "remedies": ["Configure ingress_from.sources.access_level with a specific AccessLevel instead of '*'."],
  },
  {
    "condition": "Ingress source access level must not allow all ingress sources.",
    "attribute_path": ["ingress_from", 0, "sources", 0, "access_level"],
    "values": ["*"],
    "policy_type": "blacklist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
