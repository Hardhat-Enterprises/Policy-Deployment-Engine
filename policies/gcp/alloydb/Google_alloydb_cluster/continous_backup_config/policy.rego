package terraform.gcp.security.alloydb.google_alloydb_cluster.continuous_backup_config

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster.vars as vars

conditions := [
	[
		{
			"situation_description": "Continuous backup must be enabled.",
			"remedies": ["Set continuous_backup_config.enabled to true."],
		},
		{
			"condition": "Enabled must be true.",
			"attribute_path": ["continuous_backup_config", "enabled"],
			"values": [true],
			"policy_type": "whitelist",
		},
	],
	[
		{
			"situation_description": "CMEK key must be configured for continuous backup.",
			"remedies": ["Set continuous_backup_config.encryption_config.kms_key_name to a valid KMS key self-link."],
		},
		{
			"condition": "kms_key_name must be present (not null/empty).",
			"attribute_path": ["continuous_backup_config", "encryption_config", "kms_key_name"],
			"values": [null, ""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Retention must use an approved value (seconds).",
			"remedies": ["Choose one of: 604800, 1209600, 1814400, 2419200, 2592000."],
		},
		{
			"condition": "Retention must be in the approved list.",
			"attribute_path": ["continuous_backup_config", "recovery_window_seconds"],
			"values": [604800, 1209600, 1814400, 2419200, 2592000],
			"policy_type": "whitelist",
		},
	],
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
