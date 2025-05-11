package terraform.gcp.security.access_manager.gcp_user_access_binding.organization_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.gcp_user_access_binding.organization_id.vars

conditions := [
  [
    {"situation_description" : "The organization_id used is not from the approved list",
     "remedies": [ "Use the official organization ID: 123456789012" ]},
    {
      "condition": "Check if the organization_id is approved",
      "attribute_path" : ["organization_id"],
      "values" : ["123456789012"],
      "policy_type" : "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details