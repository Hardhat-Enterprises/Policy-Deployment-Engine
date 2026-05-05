package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.scheduler_service_account_email

import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "If the scheduler_service_account_email attribute does not have a dedicated email address, security risks my arise from using a default account",
		"remedies": ["Assign a dedicated service account email to the scheduler_service_account_email attribute"],
	},
	{
		"condition": "check if the scheduler_service_account_email attribute has a dedicated email address",
		"attribute_path": ["scheduler_service_account_email"],
		"values": ["pipeline-scheduler@project-id.iam.gserviceaccount.com"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
