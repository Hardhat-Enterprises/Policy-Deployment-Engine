package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.combining_function

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
  [
    {
      "situation_description": "How the conditions list should be combined to determine if a request is granted this AccessLevel. If AND is used, each Condition in conditions must be satisfied for the AccessLevel to be applied. If OR is used, at least one Condition in conditions must be satisfied for the AccessLevel to be applied.",
      "remedies": ["Update combining_function to AND as per organizational policy."]
    },
    {
      "condition": "os_type is not in blacklist",
      "attribute_path": ["basic", 0, "combining_function"],
      "values": ["AND"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details