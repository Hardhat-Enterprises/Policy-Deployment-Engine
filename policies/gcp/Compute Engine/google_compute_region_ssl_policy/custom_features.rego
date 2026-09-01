package terraform.gcp.security.compute_engine.google_compute_region_ssl_policy.custom_features

import data.terraform.gcp.security.compute_engine.google_compute_region_ssl_policy.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Regional SSL policy contains a known weak or legacy cipher suite.",
			"remedies": [
				"Remove CBC, 3DES, and static-RSA cipher suites from custom_features.",
				"Use ECDHE cipher suites with AES-GCM or ChaCha20-Poly1305.",
			],
		},
		{
			"condition": "custom_features must not contain known weak or legacy cipher suites.",
			"attribute_path": ["custom_features"],
			"values": [
				"TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA",
				"TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA",
				"TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA",
				"TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA",
				"TLS_RSA_WITH_AES_128_GCM_SHA256",
				"TLS_RSA_WITH_AES_256_GCM_SHA384",
				"TLS_RSA_WITH_AES_128_CBC_SHA",
				"TLS_RSA_WITH_AES_256_CBC_SHA",
				"TLS_RSA_WITH_3DES_EDE_CBC_SHA",
			],
			"policy_type": "element blacklist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
