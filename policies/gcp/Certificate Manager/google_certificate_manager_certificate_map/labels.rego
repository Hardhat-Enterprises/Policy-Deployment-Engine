package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_map.labels

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_map.vars

conditions := [
	[
		{
			"situation_description": "When a certificate map does not use an approved environment label, it may be harder to identify which environment the map belongs to and apply the correct certificate governance controls.",
			"remedies": "Set the environment label on the certificate map to an approved value.",
		},
		{
			"condition": "Certificate map should use an approved environment label",
			"attribute_path": ["labels", "environment"],
			"values": ["prod"],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details