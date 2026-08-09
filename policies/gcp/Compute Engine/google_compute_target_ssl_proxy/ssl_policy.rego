package terraform.gcp.security.compute_engine.google_compute_target_ssl_proxy.ssl_policy

import data.terraform.gcp.security.compute_engine.google_compute_target_ssl_proxy.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Target SSL proxy does not have an SSL policy configured.",
			"remedies": [
				"Set ssl_policy to a valid Google Compute SSL policy so the proxy uses an explicit TLS configuration.",
			],
		},
		{
			"condition": "ssl_policy must be configured.",
			"attribute_path": ["ssl_policy"],
			"values": [null],
			"policy_type": "blacklist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
