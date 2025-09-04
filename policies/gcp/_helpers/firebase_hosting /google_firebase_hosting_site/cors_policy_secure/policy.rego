package terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.cors_policy_secure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.vars

conditions := [
	[
		{
			"situation_description": "CORS policy must not allow overly permissive origins",
			"remedies": ["Remove wildcard (*) origins", "Specify explicit trusted domains", "Use specific origin allowlists"],
		},
		{
			"condition": "Validating CORS origins are not wildcard",
			"attribute_path": ["headers", 0, "value"],
			"values": ["*"],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "CORS credentials should be carefully controlled",
			"remedies": ["Set Access-Control-Allow-Credentials to false for public APIs", "Only allow credentials for authenticated endpoints"],
		},
		{
			"condition": "Validating CORS credentials setting",
			"attribute_path": ["headers", 0, "key"],
			"values": ["Access-Control-Allow-Credentials"],
			"policy_type": "whitelist",
		},
	],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details