package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_ingress_policies_ingress_to_operations_method_selectors_permission

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Ingress policies should explicitly select required IAM permissions instead of allowing overly broad permissions.",
    "remedies": ["Configure spec.ingress_policies.ingress_to.operations.method_selectors.permission with a specific IAM permission instead of '*'."],
  },
  {
    "condition": "Ingress permission selector must not allow unrestricted permissions.",
    "attribute_path": ["spec", "ingress_policies", "ingress_to", "operations", "method_selectors", "permission"],
    "values": ["*"],
    "policy_type": "blacklist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
