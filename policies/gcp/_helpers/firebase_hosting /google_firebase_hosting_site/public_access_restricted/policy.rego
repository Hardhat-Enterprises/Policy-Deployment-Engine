package terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.public_access_restricted

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.vars

conditions := [[
	{
		"situation_description": "Firebase Hosting should not allow unrestricted public access to sensitive directories",
		"remedies": ["Configure access controls", "Use Firebase Auth for authentication", "Restrict access to admin/config directories"],
	},
	{
		"condition": "Validating restricted access patterns are not publicly exposed",
		"attribute_path": ["rewrites", 0, "source"],
		"values": ["/admin/*", "/config/*", "/.env*", "/api/admin/*"],
		"policy_type": "pattern blacklist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details