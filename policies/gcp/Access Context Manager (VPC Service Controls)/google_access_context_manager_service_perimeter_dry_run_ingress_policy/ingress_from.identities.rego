package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.ingress_from_identities

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.vars as vars

conditions := [[
  {
    "situation_description": "Ingress policies should allow only explicitly specified users or service accounts.",
    "remedies": ["Configure ingress_from.identities with specific user or service account identities instead of wildcard or public principals."],
  },
  {
    "condition": "Each ingress identity must not be a wildcard or public principal.",
    "attribute_path": ["ingress_from", 0, "identities"],
    "values": ["*", "allUsers", "allAuthenticatedUsers"],
    "policy_type": "element blacklist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
