package terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.ssl_enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.vars

conditions := [[
	{
		"situation_description": "Firebase Hosting site must have SSL/TLS encryption enabled",
		"remedies": ["Enable SSL by setting ssl_state to 'SSL_ENABLED' or ensure HTTPS is enforced"],
	},
	{
		"condition": "Validating SSL state is enabled",
		"attribute_path": ["ssl_state"],
		"values": ["SSL_ENABLED"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details