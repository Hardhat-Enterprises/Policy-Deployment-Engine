package terraform.gcp.security.dms.private_connection.display_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dms.private_connection.vars

conditions := [
  [
    {
      "situation_description": "Display name is not set. It's recommended for readability and manageability.",
      "remedies": ["Set a meaningful 'display_name'."]
    },
    {
      "condition": "Missing or empty display_name",
      "attribute_path": ["display_name"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
