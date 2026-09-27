package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.perimeter_type

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Service Perimeter should use the regular perimeter type to enforce access restrictions.",
    "remedies": ["Set perimeter_type = PERIMETER_TYPE_REGULAR."],
  },
  {
    "condition": "perimeter_type must be PERIMETER_TYPE_REGULAR.",
    "attribute_path": ["perimeter_type"],
    "values": ["PERIMETER_TYPE_REGULAR"],
    "policy_type": "whitelist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
