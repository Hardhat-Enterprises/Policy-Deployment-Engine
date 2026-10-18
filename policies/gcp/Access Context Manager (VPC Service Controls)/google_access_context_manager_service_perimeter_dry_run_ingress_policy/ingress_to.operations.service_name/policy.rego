package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.ingress_to_operations_service_name

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.vars as vars

conditions := [[
  {
    "situation_description": "Ingress policies should explicitly select required services instead of allowing all services.",
    "remedies": ["Configure ingress_to.operations.service_name with a specific service name instead of '*'."],
  },
  {
    "condition": "Ingress service name must not allow all services.",
    "attribute_path": ["ingress_to", 0, "operations", 0, "service_name"],
    "values": ["*"],
    "policy_type": "blacklist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
