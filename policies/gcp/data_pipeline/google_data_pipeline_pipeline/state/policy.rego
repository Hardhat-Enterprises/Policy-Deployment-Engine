package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.state

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [[
	{
		"situation_description": "If the state attribute is not set to STATE_ACTIVE or STATE_PAUSED, the pipeline may be in an unstable and could disrupt scheduled operations.",
		"remedies": ["Change the state attribute to either STATE_ACTIVE or STATE_PAUSED."],
	},
	{
		"condition": "check to see that the state attribute is set to either STATE_ACTIVE or STATE_PAUSED.",
		"attribute_path": ["state"],
		"values": ["STATE_ACTIVE", "STATE_PAUSED"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
