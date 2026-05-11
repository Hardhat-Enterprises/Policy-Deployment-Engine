package terraform.gcp.security.cloud_bigtable.google_bigtable_table.automated_backup_policy_required
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_table.vars
conditions := [
	[
		{
			"situation_description": "Bigtable tables must declare an `automated_backup_policy` block; without it the table has no scheduled backups.",
			"remedies": [
				"Add an `automated_backup_policy` block with non-zero `retention_period` and `frequency` on `google_bigtable_table`.",
			],
		},
		{
			"condition":      "automated_backup_policy must be present",
			"attribute_path": ["automated_backup_policy"],
			"values":         [null],
			"policy_type":    "blacklist",
		},
	],
	[
		{
			"situation_description": "Automated backups must not be disabled via `retention_period = 0` on `automated_backup_policy`.",
			"remedies": [
				"Set `retention_period` to a positive duration (for example 72h) instead of 0.",
			],
		},
		{
			"condition":      "retention_period must not be disabled (0)",
			"attribute_path": ["automated_backup_policy", 0, "retention_period"],
			"values":         ["0"],
			"policy_type":    "blacklist",
		},
	],
	[
		{
			"situation_description": "Automated backups must not be disabled via `frequency = 0` on `automated_backup_policy`.",
			"remedies": [
				"Set `frequency` to a positive interval (for example 24h) instead of 0.",
			],
		},
		{
			"condition":      "frequency must not be disabled (0)",
			"attribute_path": ["automated_backup_policy", 0, "frequency"],
			"values":         ["0"],
			"policy_type":    "blacklist",
		},
	],
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
