package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.require_screen_lock

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.vars

conditions := [
    [
    {
      "situation_description": "EWhether or not screenlock is required for the DevicePolicy to be true.",
      "remedies": ["Update require_screen_lock to true."]
    },
    {
      "condition": "require_screen_lock is true",
      "attribute_path": ["access_levels", 0, "basic", 0, "conditions", 0, "device_policy", 0, "require_screen_lock"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details