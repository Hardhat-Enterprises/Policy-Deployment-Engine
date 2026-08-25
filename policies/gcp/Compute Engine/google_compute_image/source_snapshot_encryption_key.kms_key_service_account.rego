package terraform.gcp.security.compute_engine.google_compute_image.source_snapshot_encryption_key_kms_key_service_account

import data.terraform.gcp.security.compute_engine.google_compute_image.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "The source snapshot KMS encryption configuration does not explicitly specify a service account.",
			"remedies": [
				"Set source_snapshot_encryption_key.kms_key_service_account to an appropriate service account authorised to use the configured Cloud KMS key.",
			],
		},
		{
			"condition": "A service account must be explicitly specified for source snapshot Cloud KMS operations.",
			"attribute_path": ["source_snapshot_encryption_key", 0, "kms_key_service_account"],
			"values": [null, ""],
			"policy_type": "blacklist",
		},
	],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
