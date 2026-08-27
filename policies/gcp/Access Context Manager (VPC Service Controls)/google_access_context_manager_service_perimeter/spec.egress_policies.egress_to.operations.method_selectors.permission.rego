package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_egress_policies_egress_to_operations_method_selectors_permission

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Egress operations should use explicitly selected IAM permissions instead of overly broad permissions.",
    "remedies": ["Configure spec.egress_policies.egress_to.operations.method_selectors.permission with an explicit IAM permission instead of '*'."],
  },
  {
    "condition": "Egress permission selector must not allow all permissions.",
    "attribute_path": ["spec", 0, "egress_policies", 0, "egress_to", 0, "operations", 0, "method_selectors", 0, "permission"],
    "values": ["*"],
    "policy_type": "blacklist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
