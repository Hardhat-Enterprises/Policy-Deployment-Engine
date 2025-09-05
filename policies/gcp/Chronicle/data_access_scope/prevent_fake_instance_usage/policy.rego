package terraform.gcp.security.Chronicle.data_access_scope.prevent_fake_instance_usage

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Chronicle.data_access_scope.vars

conditions := [
  [
  # Deny certain instances
    {
      "situation_description": "Disallowed `instance` used.",
      "remedies": [
        "Avoid using placeholder or deprecated instances like '00000000-0000-0000-0000-000000000000'."
      ]
    },
    {
      "condition": "Disallow fake or invalid instance IDs",
      "attribute_path": ["instance"],
      "values": ["00000000-0000-0000-0000-000000000000"],
      "policy_type": "blacklist"
    }
  ]  

]

message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed report of each condition and situation
details := helpers.get_multi_summary(conditions, vars.variables).details