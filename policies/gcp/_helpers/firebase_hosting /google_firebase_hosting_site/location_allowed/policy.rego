package terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.location_allowed

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.vars

conditions := [[
	{
		"situation_description": "Firebase Hosting must be deployed in approved geographic locations",
		"remedies": ["Deploy to approved regions only", "Use us-central1, europe-west1, or asia-southeast1", "Avoid restricted regions"],
	},
	{
		"condition": "Validating deployment location is in approved regions",
		"attribute_path": ["location_id"],
		"values": ["us-central1", "europe-west1", "asia-southeast1", "us-east1", "europe-west2"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details