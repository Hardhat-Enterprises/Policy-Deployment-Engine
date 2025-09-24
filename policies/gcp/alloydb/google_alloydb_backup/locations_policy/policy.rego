package terraform.gcp.security.alloydb.google_alloydb_backup.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_backup.vars

# Enforce that backups are created only in approved regions (locations)

conditions := [
  [
    {
      "situation_description": "Backup location must be specified.",
      "remedies": ["Set the 'location' field to an approved region."],
    },
    {
      "condition": "Location must be present (not null/empty).",
      "attribute_path": ["location"],
      "values": [null, ""],
      "policy_type": "blacklist",
    },
  ],
  [
    {
      "situation_description": "Backup location must be in the approved region allowlist.",
      "remedies": [sprintf("Use one of: %v.", [vars.variables.allowed_locations])],
    },
    {
      "condition": "Location must be on the allowlist.",
      "attribute_path": ["location"],
      "values": vars.variables.allowed_locations,
      "policy_type": "whitelist",
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
