package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_issuance_config.certificate_authority_config_certificate_authority_service_config_ca_pool

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_issuance_config.vars

conditions := [
	[
		{
			"situation_description": "When a certificate issuance config uses a non-approved CA pool, certificates may be issued by an authority that does not meet the organisation's certificate governance requirements.",
			"remedies": "Use the approved CA pool for Certificate Manager certificate issuance configuration."
		},
		{
			"condition": "Certificate issuance config should use an approved CA pool.",
			"attribute_path": ["certificate_authority_config", 0, "certificate_authority_service_config", 0, "ca_pool"],
			"values": ["projects/sit764-policy-project/locations/us-central1/caPools/approved-ca-pool"],
			"policy_type": "whitelist"
		}
	]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
