package terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.headers_security

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.vars

conditions := [
	[
		{
			"situation_description": "Security headers must include X-Frame-Options for clickjacking protection",
			"remedies": ["Add X-Frame-Options header with DENY or SAMEORIGIN value"],
		},
		{
			"condition": "Validating X-Frame-Options header is present",
			"attribute_path": ["headers", 0, "key"],
			"values": ["X-Frame-Options"],
			"policy_type": "whitelist",
		},
	],
	[
		{
			"situation_description": "Security headers must include Content-Security-Policy",
			"remedies": ["Add Content-Security-Policy header to prevent XSS attacks"],
		},
		{
			"condition": "Validating CSP header is present",
			"attribute_path": ["headers", 0, "key"],
			"values": ["Content-Security-Policy"],
			"policy_type": "whitelist",
		},
	],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details