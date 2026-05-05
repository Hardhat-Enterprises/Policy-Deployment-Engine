package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.type

import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "if the type attribute is not set to either PIPELINE_TYPE_BATCH or PIPELINE_TYPE_STREAMING, then the pipeline is at risk of being misconfigured and not functioning as intended.",
		"remedies": ["Change the type attribute to either PIPELINE_TYPE_BATCH or PIPELINE_TYPE_STREAMING."],
	},
	{
		"condition": "check to see that the type attribute is set to either PIPELINE_TYPE_BATCH or PIPELINE_TYPE_STREAMING.",
		"attribute_path": ["type"],
		"values": ["PIPELINE_TYPE_BATCH", "PIPELINE_TYPE_STREAMING"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
