package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_ingress_policies_ingress_to_operations_method_selectors_method

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Ingress policies should explicitly select required API methods instead of allowing all methods and permissions.",
    "remedies": ["Configure spec.ingress_policies.ingress_to.operations.method_selectors.method with a specific method instead of '*'."],
  },
  {
    "condition": "Ingress method selector must not allow all methods.",
    "attribute_path": ["spec", 0, "ingress_policies", 0, "ingress_to", 0, "operations", 0, "method_selectors", 0, "method"],
    "values": ["*"],
    "policy_type": "blacklist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
