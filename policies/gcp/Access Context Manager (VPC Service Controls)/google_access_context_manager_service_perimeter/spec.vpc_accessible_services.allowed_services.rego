package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_vpc_accessible_services_allowed_services

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "VPC accessible services should explicitly select required APIs instead of allowing unrestricted API access.",
    "remedies": ["Configure spec.vpc_accessible_services.allowed_services with explicitly required services instead of '*'."],
  },
  {
    "condition": "VPC accessible services must not allow unrestricted API access.",
    "attribute_path": ["spec", "vpc_accessible_services", "allowed_services"],
    "values": ["*"],
    "policy_type": "blacklist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
