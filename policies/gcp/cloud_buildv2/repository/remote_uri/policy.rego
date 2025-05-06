package terraform.gcp.security.cloud_buildv2.repository.remote_uri

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.repository.vars

scenarios_list := [
	[
		{
			"situation_description": "Repository must point to an approved Git host using HTTPS",
			"remedies": ["Set 'remote_uri' to a valid HTTPS URL under github.com"],
		},
		{
			"condition": "Invalid or unapproved remote_uri",
			"attribute_path": ["remote_uri"],
			"values": ["https://github.com/secure/repo.git"],
			"policy_type": "whitelist",
		},
	],
	[
		{
			"situation_description": "Repository must not point to an unapproved or insecure Git host",
			"remedies": ["Ensure 'remote_uri' uses HTTPS and is hosted on approved domains"],
		},
		{
			"condition": "remote_uri points to insecure or untrusted host",
			"attribute_path": ["remote_uri"],
			"values": [
				"http://unapproved-host.com/repo.git",
				"ftp://example.com/repo.git",
				"https://example.com/repo.txt",
				"https://example.com/nonexistent-repo.git",
				"https://invalid-domain/repo.git",
			],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Repository must not use malformed or invalid remote_uri",
			"remedies": ["Ensure 'remote_uri' follows the correct URL format and points to a valid Git repository"],
		},
		{
			"condition": "Malformed or suspicious remote_uri",
			"attribute_path": ["remote_uri"],
			"values": [
				"invalid-url-format",
				"https://example.com/invalid-path",
				"https://example.com:80/repo.git",
				"https://example.com/repo.git?invalid-query",
				"https://example.com/repo.git#invalid-fragment",
			],
			"policy_type": "blacklist",
		},
	],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

details := summary.details
