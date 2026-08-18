package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.device_policy_require_corp_owned

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.vars

conditions := [
    [
    {
      "situation_description": "Whether the device needs to be corp owned.",
      "remedies": ["Update require_corp_owned to true."]
    },
    {
      "condition": "require_corp_owned is true",
      "attribute_path": ["device_policy", 0, "require_corp_owned"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
