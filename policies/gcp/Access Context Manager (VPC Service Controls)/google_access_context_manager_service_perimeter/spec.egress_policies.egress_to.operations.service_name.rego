package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_egress_policies_egress_to_operations_service_name

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Egress operations should use explicitly selected service names instead of allowing all services.",
    "remedies": ["Configure spec.egress_policies.egress_to.operations.service_name with an explicit service name instead of '*'."],
  },
  {
    "condition": "Egress service name must not allow all services.",
    "attribute_path": ["spec", "egress_policies", "egress_to", "operations", "service_name"],
    "values": ["*"],
    "policy_type": "blacklist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
