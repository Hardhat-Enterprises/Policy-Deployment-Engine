package terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.custom_domain_verification

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.vars

conditions := [[
	{
		"situation_description": "Custom domains must be properly verified and secured",
		"remedies": ["Ensure custom domain ownership is verified", "Use only trusted domains", "Enable domain verification"],
	},
	{
		"condition": "Validating custom domain verification status",
		"attribute_path": ["custom_domain", 0, "cert_preference"],
		"values": ["AUTOMATIC", "MANUAL_CERTIFICATE"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details