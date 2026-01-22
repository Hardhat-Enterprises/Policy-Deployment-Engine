package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.os_type

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.vars

conditions := [
    [
    {
      "situation_description": "Ensure access is not granted to unspecified or unsupported OS types.",
      "remedies": ["Update os_constraints to explicitly include only supported OS types."]
    },
    {
      "condition": "os_type is in whitelist",
      "attribute_path": ["device_policy", 0, "os_constraints", 0, "os_type"],
      "values": ["DESKTOP_WINDOWS","DESKTOP_LINUX","DESKTOP_MAC"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details