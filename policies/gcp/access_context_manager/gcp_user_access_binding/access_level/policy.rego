package terraform.gcp.security.access_manager.gcp_user_access_binding.access_levels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.gcp_user_access_binding.access_levels.vars

conditions := [
  [
    {"situation_description" : "The access level assigned is not in the approved list",
     "remedies": [ "Assign only approved access levels such as 'allow_secure'" ]},
    {
      "condition": "Check access_levels for allowed entries",
      "attribute_path" : ["access_levels", 0],
      "values" : ["accessPolicies/123456789012/accessLevels/allow_secure"],
      "policy_type" : "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details