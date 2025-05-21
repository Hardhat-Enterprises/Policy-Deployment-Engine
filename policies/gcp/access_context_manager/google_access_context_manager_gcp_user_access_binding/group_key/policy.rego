package terraform.gcp.security.access_manager.google_access_context_manager_gcp_user_access_binding.group_key

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.google_access_context_manager_gcp_user_access_binding.group_key.vars

conditions := [
  [
    {
      "situation_description": "The group_key is not from the organizational domain.",
      "remedies": [
        "Use a group key ending with '@deakin.edu.au'"
      ]
    },
    {
      "condition": "Ensure group_key belongs to the organization's domain.",
      "attribute_path": ["group_key"],
      "values": [["@deakin.edu.au"]],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
