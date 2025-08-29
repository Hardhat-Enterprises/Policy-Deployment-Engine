package terraform.gcp.security.access_approval.google_folder_access_approval_settings.enrollment_level

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_approval.google_folder_access_approval_settings.vars

conditions := [[
	{
		"situation_description": "Ensure default value is already assigned to the enrollment level ",
		"remedies": ["Set enrollment_level to BLOCK_ALL"],
	},
	{
		"condition": "Validating enrollment level",
		"attribute_path": ["enrolled_services", 0, "enrollment_level"],
		"values": ["BLOCK_ALL"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
