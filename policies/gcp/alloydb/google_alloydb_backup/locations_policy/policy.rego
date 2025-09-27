package terraform.gcp.security.alloydb.google_alloydb_backup.locations_policy

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_backup.vars as vars

conditions := [
	[
		{
			"situation_description": "Backup location must be specified.",
			"remedies": ["Set the `location` field to an approved region."],
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
			"remedies": ["Use one of: us-central1, us-east1."],
		},
		{
			"condition": "Location must be on the allowlist.",
			"attribute_path": ["location"],
			"values": ["us-central1", "us-east1"],
			"policy_type": "whitelist",
		},
	],
]

summary := {
  "message": helpers.get_multi_summary(conditions, vars.variables).message,
  "details": helpers.get_multi_summary(conditions, vars.variables).details
}