package terraform.gcp.security.compute_engine.google_compute_target_ssl_proxy.ssl_policy

import data.terraform.gcp.security.compute_engine.google_compute_target_ssl_proxy.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Target SSL proxy has no SSL policy attached and falls back to the default TLS settings.",
			"remedies": [
				"Attach an organisation-approved SSL policy using the expected Google Compute resource path.",
			],
		},
		{
			"condition": "ssl_policy must be configured.",
			"attribute_path": ["ssl_policy"],
			"values": [null],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Target SSL proxy does not use the approved structural SSL policy reference.",
			"remedies": [
				"Set ssl_policy using the parameterised format projects/*/global/sslPolicies/*.",
			],
		},
		{
			"condition": "ssl_policy must follow the approved Google Compute SSL policy resource path.",
			"attribute_path": ["ssl_policy"],
			"values": [
				"projects/*/global/sslPolicies/*",
				[
					["*"],
					["*"],
				],
			],
			"policy_type": "pattern whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
