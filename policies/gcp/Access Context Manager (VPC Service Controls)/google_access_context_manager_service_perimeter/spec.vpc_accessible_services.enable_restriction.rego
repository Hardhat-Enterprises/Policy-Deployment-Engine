package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_vpc_accessible_services_enable_restriction

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "VPC accessible services should restrict access to explicitly allowed services.",
    "remedies": ["Set spec.vpc_accessible_services.enable_restriction to true."],
  },
  {
    "condition": "VPC accessible services restriction must be enabled.",
    "attribute_path": ["spec", 0, "vpc_accessible_services", 0, "enable_restriction"],
    "values": [true],
    "policy_type": "whitelist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
