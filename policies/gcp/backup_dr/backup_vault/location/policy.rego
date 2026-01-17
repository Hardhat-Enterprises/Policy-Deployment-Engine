package terraform.gcp.security.backup_dr.backup_vault.location

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_vault.vars

conditions := [
  [
    {
      "situation_description": "location is not compliant.",
      "remedies": [
        "set location to an approved region (australia-southeast1 or australia-southeast2)"
      ] },
    {
      "condition": "Check Location is in an approved region",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
