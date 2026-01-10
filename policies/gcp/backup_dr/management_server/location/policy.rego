package terraform.gcp.security.backup_dr.management_server.location

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.management_server.vars

conditions := [
  [
    {
      "situation_description": "Management server is created in an unapproved region",
      "remedies": [
        "Update the management server location to an approved region (australia-southeast1 or australia-southeast2)"
      ]
    },
    {
      "condition": "Management server must be created in an approved region",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
