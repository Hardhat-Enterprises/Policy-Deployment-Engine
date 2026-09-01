package terraform.gcp.security.compute_engine.google_compute_image.family

import data.terraform.gcp.security.compute_engine.google_compute_image.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "The Compute Image uses an image family that is not included in the platform-wide approved image-family allowlist.",
			"remedies": [
				"Remove the family setting when a fixed image is required, or use an approved platform-managed image family.",
			],
		},
		{
			"condition": "Image family must be unset or use an approved platform-managed family.",
			"attribute_path": ["family"],
			"values": [null, "", "approved-linux", "approved-windows"],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
