package terraform.gcp.security.cloud_buildv2.repository.parent_connection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.repository.vars

scenarios_list := [
	[
		{
			"situation_description": "Repository must use an approved connection",
			"remedies": ["Use a secure and compliant connection like 'secure-connection'"],
		},
		{
			"condition": "Connection used is not allowed",
			"attribute_path": ["parent_connection"],
			"values": ["projects/demo/locations/global/connections/secure-connection"],
			"policy_type": "whitelist",
		},
	],
	[
		{
			"situation_description": "Repository must not use a disabled connection",
			"remedies": ["Ensure the connection is enabled and not disabled"],
		},
		{
			"condition": "Connection used is disabled",
			"attribute_path": ["parent_connection"],
			"values": ["projects/demo/locations/global/connections/disabled-connection"],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Repository must not use a connection with an invalid format",
			"remedies": ["Ensure the connection name follows the correct format"],
		},
		{
			"condition": "Connection name format is invalid",
			"attribute_path": ["parent_connection"],
			"values": ["invalid-connection-name"],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Repository must not use a connection with an invalid region",
			"remedies": ["Ensure the connection is in the correct region"],
		},
		{
			"condition": "Connection region is invalid",
			"attribute_path": ["parent_connection"],
			"values": ["projects/demo/locations/invalid-region/connections/connection-name"],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Repository must not use a connection with an invalid project ID",
			"remedies": ["Ensure the connection is in the correct project"],
		},
		{
			"condition": "Connection project ID is invalid",
			"attribute_path": ["parent_connection"],
			"values": ["projects/invalid-project/locations/global/connections/connection-name"],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Repository must not use a connection with an invalid connection ID",
			"remedies": ["Ensure the connection ID is valid"],
		},
		{
			"condition": "Connection ID is invalid",
			"attribute_path": ["parent_connection"],
			"values": ["projects/demo/locations/global/connections/invalid-connection-id"],
			"policy_type": "blacklist",
		},
	],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

details := summary.details
