package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_device_policy_allowed_device_management_levels

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
  [
    {
      "situation_description": "A list of allowed device management levels. An empty list allows all management levels. Each value may be one of: MANAGEMENT_UNSPECIFIED, NONE, BASIC, COMPLETE",
      "remedies": ["Update allowed_device_management_levels to include only allowed values as per organizational policy."]
    },
    {
      "condition": "os_type is not in blacklist",
      "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "allowed_device_management_levels"],
      "values": ["COMPLETE"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
