package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate.location

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate.vars

conditions := [[
	{
		"situation_description": "When a certificate is created outside an approved location, certificate deployment may not align with the organisation's certificate management and governance requirements.",
		"remedies": "Use an approved certificate location for Certificate Manager certificates.",
	},
	{
		"condition": "Certificate location should use an approved value.",
		"attribute_path": ["location"],
		"values": ["australia-southeast1", "australia-southeast2"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
