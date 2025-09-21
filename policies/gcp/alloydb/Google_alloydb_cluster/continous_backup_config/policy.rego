package terraform.gcp.security.alloydb.google_alloydb_cluster.continuous_backup_config

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster.vars as vars

conditions := [
	[
		{
			"situation_description": "Continuous backup must be enabled.",
			"remedies": ["Set continuous_backup_config.enabled = true."],
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
			"situation_description": "CMEK must be configured for continuous backup.",
			"remedies": ["Set continuous_backup_config.encryption_config.kms_key_name to a valid KMS key self-link."],
		},
		{
			"condition": "kms_key_name must be present.",
			"attribute_path": ["continuous_backup_config", "encryption_config", "kms_key_name"],
			"policy_type": "value_absent_or_empty",
		},
	],
	[
		{
			"situation_description": "CMEK self-link must match expected format.",
			"remedies": ["Use projects/<P>/locations/<L>/keyRings/<R>/cryptoKeys/<K>."],
		},
		{
			"condition": "kms_key_name must match regex.",
			"attribute_path": ["continuous_backup_config", "encryption_config", "kms_key_name"],
			"regex": vars.variables.kms_key_self_link_regex,
			"policy_type": "regex_mismatch",
		},
	],
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
