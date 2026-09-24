package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_entity_type.deletion_policy

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_entity_type.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The entity type is not protected from deletion by Terraform.",
		"remedies": ["Set deletion_policy to PREVENT."],
	},
	{
		"condition": "Require Terraform deletion protection",
		"attribute_path": ["deletion_policy"],
		"values": ["PREVENT"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
