package terraform.gcp.security.compute_engine.google_compute_image.shielded_instance_initial_state_pk_file_type

import data.terraform.gcp.security.compute_engine.google_compute_image.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "The Platform Key for the Shielded Compute Image uses an unsupported file type.",
			"remedies": [
				"Set shielded_instance_initial_state.pk.file_type to BIN or X509.",
			],
		},
		{
			"condition": "A configured Platform Key must use a supported file type.",
			"attribute_path": ["shielded_instance_initial_state", 0, "pk", 0, "file_type"],
			"values": [null, "BIN", "X509"],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
