package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.status_ingress_policies_ingress_from_identities

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Ingress access should be restricted to explicitly scoped identities.",
    "remedies": ["Configure status.ingress_policies.ingress_from.identities with specific users, groups, or service accounts instead of wildcard or public principals."],
  },
  {
    "condition": "Ingress identities must not contain wildcard or public principals.",
    "attribute_path": ["status", 0, "ingress_policies", 0, "ingress_from", 0, "identities"],
    "values": ["*", "allUsers", "allAuthenticatedUsers"],
    "policy_type": "blacklist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
