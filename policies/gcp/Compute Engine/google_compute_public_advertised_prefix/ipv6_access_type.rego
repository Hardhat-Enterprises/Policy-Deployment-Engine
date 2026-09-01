package terraform.gcp.security.compute_engine.google_compute_public_advertised_prefix.ipv6_access_type

import data.terraform.gcp.security.compute_engine.google_compute_public_advertised_prefix.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "IPv6 public advertised prefix is using EXTERNAL access without an approved need and can be announced to the internet.",
			"remedies": [
				"Set ipv6_access_type to INTERNAL when public internet advertisement is not required or approved.",
			],
		},
		{
			"condition": "ipv6_access_type must be set to INTERNAL.",
			"attribute_path": ["ipv6_access_type"],
			"values": ["INTERNAL"],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
