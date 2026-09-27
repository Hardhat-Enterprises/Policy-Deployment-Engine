package terraform.gcp.security.compute_engine.google_compute_image.shielded_instance_initial_state_dbs_file_type

import data.terraform.gcp.security.compute_engine.google_compute_image.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "The trusted Secure Boot signature database uses an unsupported file type.",
			"remedies": [
				"Set shielded_instance_initial_state.dbs.file_type to BIN or X509.",
			],
		},
		{
			"condition": "A configured trusted Secure Boot signature database must use a supported file type.",
			"attribute_path": ["shielded_instance_initial_state", 0, "dbs", "file_type"],
			"values": [null, "BIN", "X509"],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
