package terraform.gcp.security.certificate_manager.google_certificate_manager_dns_authorization.domain

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_dns_authorization.vars

conditions := [
	[
		{
			"situation_description": "When a DNS authorization uses a non-approved domain, certificates may be authorised for domains outside the organisation's controlled domain list.",
			"remedies": "Use only approved organisation domains for Certificate Manager DNS authorization."
		},
		{
			"condition": "DNS authorization domain should be in the approved organisation domain list.",
			"attribute_path": ["domain"],
			"values": ["example.com"],
			"policy_type": "whitelist"
		}
	]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
