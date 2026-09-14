package terraform.gcp.security.compute_engine.google_compute_region_ssl_policy.min_tls_version

import data.terraform.gcp.security.compute_engine.google_compute_region_ssl_policy.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Regional SSL policy allows clients to connect using an old TLS version.",
			"remedies": [
				"Set min_tls_version to TLS_1_2 or TLS_1_3.",
			],
		},
		{
			"condition": "min_tls_version must be TLS_1_2 or TLS_1_3.",
			"attribute_path": ["min_tls_version"],
			"values": [
				"TLS_1_2",
				"TLS_1_3",
			],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
