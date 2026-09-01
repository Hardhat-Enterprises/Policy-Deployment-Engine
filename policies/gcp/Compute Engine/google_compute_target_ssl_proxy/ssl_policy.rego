package terraform.gcp.security.compute_engine.google_compute_target_ssl_proxy.ssl_policy

import data.terraform.gcp.security.compute_engine.google_compute_target_ssl_proxy.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Target SSL proxy has no SSL policy attached and therefore uses the default compatible TLS settings.",
			"remedies": [
				"Attach an organisation-approved SSL policy without requiring a specific project or policy name.",
			],
		},
		{
			"condition": "ssl_policy must contain a resource reference rather than being unset.",
			"attribute_path": ["ssl_policy"],
			"values": [null],
			"policy_type": "blacklist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
