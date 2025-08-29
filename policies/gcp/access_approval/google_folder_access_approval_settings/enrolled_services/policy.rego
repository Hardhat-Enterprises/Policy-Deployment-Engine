package terraform.gcp.security.access_approval.google_folder_access_approval_settings.enrolled_services

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_approval.google_folder_access_approval_settings.vars

conditions := [[
	{
		"situation_description": "Ensure all the access is provided to cloud product",
		"remedies": ["Set cloud_product to all"],
	},
	{
		"condition": "Validating entrolled services",
		"attribute_path": ["enrolled_services", 0, "cloud_product"],
		"values": ["all"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
