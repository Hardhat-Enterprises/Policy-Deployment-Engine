package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.ingress_to_operations_method_selectors_permission

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.vars as vars

conditions := [[
  {
    "situation_description": "Ingress policies should explicitly select required IAM permissions instead of allowing overly broad permissions.",
    "remedies": ["Configure ingress_to.operations.method_selectors.permission with a specific IAM permission instead of '*'."],
  },
  {
    "condition": "Ingress permission selector must not allow unrestricted permissions.",
    "attribute_path": ["ingress_to", 0, "operations", 0, "method_selectors", 0, "permission"],
    "values": ["*"],
    "policy_type": "blacklist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
