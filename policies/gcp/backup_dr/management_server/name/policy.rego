package terraform.gcp.security.backup_dr.management_server.name

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.management_server.vars



conditions := [
  [
    {
      "situation_description": "Management server is created with a non-compliant name format",
      "remedies": [
        "Update the management server name to match the required pattern: ms-<lowercase letters/numbers/hyphens> (example: ms-prod-01)"
      ]
    },
    {
      "condition": "Management server name must follow the required naming convention",
      "attribute_path": ["name"],
      "values": "^ms-[a-z0-9-]{1,58}$",
      "policy_type": "regex"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
