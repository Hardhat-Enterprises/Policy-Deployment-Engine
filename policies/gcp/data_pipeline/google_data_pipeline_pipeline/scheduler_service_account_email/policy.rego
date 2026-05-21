package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.scheduler_service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [[
	{
		"situation_description": "If the scheduler_service_account_email attribute does not use an approved email format, security risks may arise from using unauthorised service accounts",
		"remedies": ["Assign an approved service account email to the scheduler_service_account_email attribute"],
	},
	{
		"condition": "check if the scheduler_service_account_email attribute uses an approved email format",
		"attribute_path": ["scheduler_service_account_email"],
		"values": ["*@companyname.com", [["Employee"]]],
		"policy_type": "pattern whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details