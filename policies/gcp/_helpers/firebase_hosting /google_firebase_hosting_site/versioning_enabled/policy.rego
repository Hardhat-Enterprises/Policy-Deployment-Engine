package terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.versioning_enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.vars

conditions := [[
	{
		"situation_description": "Firebase Hosting should maintain version history for rollback capabilities",
		"remedies": ["Ensure versioning is enabled", "Configure retention policies", "Enable deployment history"],
	},
	{
		"condition": "Validating version retention count is appropriate",
		"attribute_path": ["version_retention_count"],
		"values": [1, 50],
		"policy_type": "range",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details