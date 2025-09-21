package terraform.gcp.security.alloydb.google_alloydb_backup.kms_key_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_backup.vars

conditions := [
	[
		{
			"situation_description": "Backup created without CMEK.",
			"remedies": [
				"Set encryption_config.kms_key_name to a valid KMS key self-link.",
				"Ensure the key is in a compatible region and IAM grants allow AlloyDB to use it.",
			],
		},
		{
			"condition": "CMEK must be specified.",
			"attribute_path": ["encryption_config", "kms_key_name"],
			"policy_type": "value_absent_or_empty",
		},
	],
	[
		{
			"situation_description": "CMEK value must look like a valid KMS key self-link.",
			"remedies": ["Use the format projects/<PROJECT>/locations/<LOCATION>/keyRings/<RING>/cryptoKeys/<KEY>."],
		},
		{
			"condition": "CMEK must match required format (if regex provided).",
			"attribute_path": ["encryption_config", "kms_key_name"],
			"regex": vars.variables.kms_key_self_link_regex,
			"policy_type": "regex_mismatch",
		},
	],
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
