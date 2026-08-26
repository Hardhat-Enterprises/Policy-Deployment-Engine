package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_ingress_policies_ingress_from_identities

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Ingress policies should allow only explicitly specified users or service accounts.",
    "remedies": ["Configure spec.ingress_policies.ingress_from.identities with specific user or service account identities instead of wildcard or public principals."],
  },
  {
    "condition": "Ingress identities must not contain wildcard or public principals.",
    "attribute_path": ["spec", "ingress_policies", "ingress_from", "identities"],
    "values": ["*", "allUsers", "allAuthenticatedUsers"],
    "policy_type": "blacklist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
