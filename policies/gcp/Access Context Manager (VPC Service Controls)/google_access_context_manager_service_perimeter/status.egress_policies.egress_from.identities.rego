package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.status_egress_policies_egress_from_identities

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Egress access should be restricted to explicitly scoped identities.",
    "remedies": ["Configure status.egress_policies.egress_from.identities with specific users, groups, or service accounts instead of wildcard or public principals."],
  },
  {
    "condition": "Egress identities must not contain wildcard or public principals.",
    "attribute_path": ["status", "egress_policies", "egress_from", "identities"],
    "values": ["*", "allUsers", "allAuthenticatedUsers"],
    "policy_type": "blacklist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
