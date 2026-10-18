package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.status_access_levels

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Service Perimeter status should contain configured access levels.",
    "remedies": ["Configure status.access_levels with at least one valid AccessLevel."],
  },
  {
    "condition": "Status access levels must not be empty.",
    "attribute_path": ["status", 0, "access_levels"],
    "values": null,
    "policy_type": "blacklist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
