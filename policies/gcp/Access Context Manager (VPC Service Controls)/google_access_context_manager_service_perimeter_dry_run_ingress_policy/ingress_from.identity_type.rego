package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.ingress_from_identity_type

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.vars as vars

conditions := [[
  {
    "situation_description": "Ingress policies should use appropriately scoped identity types instead of allowing any identity.",
    "remedies": ["Configure ingress_from.identity_type with a scoped identity type instead of ANY_IDENTITY."],
  },
  {
    "condition": "Ingress identity type must not allow any identity.",
    "attribute_path": ["ingress_from", 0, "identity_type"],
    "values": ["ANY_IDENTITY"],
    "policy_type": "blacklist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
