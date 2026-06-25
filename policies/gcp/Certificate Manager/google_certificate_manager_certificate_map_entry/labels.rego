package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_map_entry.labels

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_map_entry.vars

conditions := [
	[
		{
			"situation_description": "When a certificate map entry does not use an approved environment label, it may be harder to identify which environment the certificate routing configuration belongs to.",
			"remedies": "Set the certificate map entry environment label to an approved value.",
		},
		{
			"condition": "Certificate map entry should use an approved environment label.",
			"attribute_path": ["labels", "environment"],
			"values": ["production"],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details