package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate.managed_issuance_config

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate.vars

conditions := [[
	{
		"situation_description": "When a certificate uses a non-approved issuance config, it may be issued from an unapproved certificate authority configuration and weaken certificate governance.",
		"remedies": "Use an approved certificate issuance config for Certificate Manager certificates.",
	},
	{
		"condition": "Certificate managed issuance config should use an approved value.",
		"attribute_path": ["managed", 0, "issuance_config"],
		"values": ["projects/sit764-policy-project/locations/global/certificateIssuanceConfigs/approved-issuance-config"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
