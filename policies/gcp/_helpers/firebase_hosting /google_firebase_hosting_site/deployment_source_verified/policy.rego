package terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.deployment_source_verified

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.vars

conditions := [[
	{
		"situation_description": "Firebase Hosting deployments must come from verified and trusted sources",
		"remedies": ["Use GitHub Actions or Cloud Build for deployments", "Enable source verification", "Avoid manual or unverified deployments"],
	},
	{
		"condition": "Validating deployment source is from trusted CI/CD systems",
		"attribute_path": ["deployment_source", 0, "type"],
		"values": ["GITHUB_ACTIONS", "CLOUD_BUILD", "GITLAB_CI"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details