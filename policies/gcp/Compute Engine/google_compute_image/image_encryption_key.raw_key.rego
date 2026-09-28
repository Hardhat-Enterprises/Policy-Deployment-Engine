package terraform.gcp.security.compute_engine.google_compute_image.image_encryption_key_raw_key

import data.terraform.gcp.security.compute_engine.google_compute_image.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "A raw customer-supplied encryption key is defined directly in Terraform.",
			"remedies": [
				"Remove the raw encryption key from the Terraform configuration and manage encryption keys through a secure key-management process.",
			],
		},
		{
			"condition": "Raw encryption key material should not be defined directly.",
			"attribute_path": ["image_encryption_key", 0, "raw_key"],
			"values": [null],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
