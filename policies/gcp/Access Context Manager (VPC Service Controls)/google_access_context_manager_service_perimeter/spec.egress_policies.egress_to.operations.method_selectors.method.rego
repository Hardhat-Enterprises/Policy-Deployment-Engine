package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_egress_policies_egress_to_operations_method_selectors_method

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Egress operations should use explicitly selected API methods instead of allowing all methods.",
    "remedies": ["Configure spec.egress_policies.egress_to.operations.method_selectors.method with an explicit method instead of '*'."],
  },
  {
    "condition": "Egress method selector must not allow all methods.",
    "attribute_path": ["spec", "egress_policies", "egress_to", "operations", "method_selectors", "method"],
    "values": ["*"],
    "policy_type": "blacklist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
