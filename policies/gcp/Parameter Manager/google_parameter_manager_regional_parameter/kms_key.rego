package terraform.gcp.security.parameter_manager.google_parameter_manager_regional_parameter.kms_key

import data.terraform.helpers
import data.terraform.gcp.security.parameter_manager.google_parameter_manager_regional_parameter.vars

conditions := [[
	{
		"situation_description": "Parameters should be encrypted",
		"remedies": ["Enable kms"],
	},
	{
		"condition": "c1 Parameter is not encrypted",
		"attribute_path": ["kms_key"],
		"values": [null, ""],
		"policy_type": "blacklist",
	},
]]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

details := summary.details
