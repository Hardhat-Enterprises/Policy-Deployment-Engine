package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.status_egress_policies_egress_from_identity_type

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Egress identity types should not allow unrestricted identities.",
    "remedies": ["Configure status.egress_policies.egress_from.identity_type with an appropriately scoped identity type instead of ANY_IDENTITY."],
  },
  {
    "condition": "Egress identity type must not be ANY_IDENTITY.",
    "attribute_path": ["status", "egress_policies", "egress_from", "identity_type"],
    "values": ["ANY_IDENTITY"],
    "policy_type": "blacklist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
