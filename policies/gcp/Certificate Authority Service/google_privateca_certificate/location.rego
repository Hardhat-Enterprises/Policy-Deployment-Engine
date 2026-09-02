package terraform.gcp.security.certificate_authority_service.google_privateca_certificate.location

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate.vars

conditions := [
	[
		{
			"situation_description": "Certificate must be deployed in an approved geographic region.",
			"remedies": [
				"Set the location field to an approved region such as 'australia-southeast1' or 'australia-southeast2'.",
				"Run 'gcloud privateca locations list' to see all available regions.",
			],
		},
		{
			"condition": "Location is in approved region whitelist",
			"attribute_path": ["location"],
			"values": ["australia-southeast1", "australia-southeast2"],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
