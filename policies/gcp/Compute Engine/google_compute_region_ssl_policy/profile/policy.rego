package terraform.gcp.security.compute_engine.google_compute_region_ssl_policy.profile

import data.terraform.gcp.security.compute_engine.google_compute_region_ssl_policy.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Regional SSL policy is using the COMPATIBLE profile, which allows older TLS capabilities.",
			"remedies": [
				"Use MODERN, RESTRICTED, CUSTOM, or FIPS_202205 based on the security requirements.",
			],
		},
		{
			"condition": "profile must use an approved SSL profile.",
			"attribute_path": ["profile"],
			"values": [
				"MODERN",
				"RESTRICTED",
				"CUSTOM",
				"FIPS_202205",
			],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
