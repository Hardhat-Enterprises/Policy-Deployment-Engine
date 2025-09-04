package terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.redirect_rules_secure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_site.vars

conditions := [[
	{
		"situation_description": "Firebase Hosting redirect rules must not contain insecure external redirects",
		"remedies": ["Remove or secure external redirects", "Ensure redirects use HTTPS only", "Validate redirect destinations are trusted"],
	},
	{
		"condition": "Validating redirect rules do not contain insecure external URLs",
		"attribute_path": ["redirect", 0, "location"],
		"values": ["http://*", "ftp://*", "file://*"],
		"policy_type": "pattern blacklist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details