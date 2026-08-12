package terraform.gcp.security.compute_engine.google_compute_region_ssl_policy.custom_features

import data.terraform.gcp.security.compute_engine.google_compute_region_ssl_policy.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Regional SSL policy contains a custom cipher that is not in the approved cipher list.",
			"remedies": [
				"Remove weak custom ciphers and use approved ECDHE cipher suites with AES-GCM or ChaCha20-Poly1305.",
			],
		},
		{
			"condition": "custom_features must only contain approved strong cipher suites.",
			"attribute_path": ["custom_features"],
			"values": [
				"TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256",
				"TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256",
				"TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256",
				"TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
				"TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
				"TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
			],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
