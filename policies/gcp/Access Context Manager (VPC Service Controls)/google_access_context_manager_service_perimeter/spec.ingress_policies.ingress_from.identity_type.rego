package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_ingress_policies_ingress_from_identity_type

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Ingress policies should use appropriately scoped identity types instead of allowing any identity.",
    "remedies": ["Configure spec.ingress_policies.ingress_from.identity_type with a scoped identity type instead of ANY_IDENTITY."],
  },
  {
    "condition": "Ingress identity type must not allow any identity.",
    "attribute_path": ["spec", 0, "ingress_policies", 0, "ingress_from", 0, "identity_type"],
    "values": ["ANY_IDENTITY"],
    "policy_type": "blacklist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
