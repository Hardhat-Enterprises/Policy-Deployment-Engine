package terraform.gcp.security.alloydb.google_alloydb_backup.locations_policy

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_backup.vars as vars

conditions := [
  [
    {
      "situation_description": "Backup location must be in an approved Australia region allowlist.",
      "remedies": ["Use one of: australia-southeast1, australia-southeast2."],
    },
    {
      "condition": "Location must be on the allowlist.",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist",
    },
  ],
]

summary := {
  "message": helpers.get_multi_summary(conditions, vars.variables).message,
  "details": helpers.get_multi_summary(conditions, vars.variables).details,
}