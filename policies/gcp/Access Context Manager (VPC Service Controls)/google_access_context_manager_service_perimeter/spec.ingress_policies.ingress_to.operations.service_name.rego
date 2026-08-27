package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_ingress_policies_ingress_to_operations_service_name

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Ingress policies should explicitly select required services instead of allowing all services.",
    "remedies": ["Configure spec.ingress_policies.ingress_to.operations.service_name with a specific service name instead of '*'."],
  },
  {
    "condition": "Ingress service name must not allow all services.",
    "attribute_path": ["spec", 0, "ingress_policies", 0, "ingress_to", 0, "operations", 0, "service_name"],
    "values": ["*"],
    "policy_type": "blacklist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
