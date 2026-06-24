package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.require_admin_approval

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.vars

conditions := [
  [
    {
      "situation_description": "Whether the device needs to be approved by the customer admin.",
      "remedies": ["Update require_admin_approval to true."]
    },
    {
      "condition": "require_admin_approval is true",
      "attribute_path": ["device_policy", 0, "require_admin_approval"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details