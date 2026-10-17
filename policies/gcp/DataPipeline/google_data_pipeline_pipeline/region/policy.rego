package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.region

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [[
	{
		"situation_description": "if the region is not set to australia-southeast1 or australia-southeast2, then the pipeline may not be located in the intended region and could lead to increased latency and data transfer costs.",
		"remedies": ["Change the region attribute to either australia-southeast1 or australia-southeast2."],
	},
	{
		"condition": "check to see that the region attribute is set to either australia-southeast1 or australia-southeast2.",
		"attribute_path": ["region"],
		"values": ["australia-southeast1", "australia-southeast2"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
