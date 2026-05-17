package terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository.service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository.vars

conditions := [[
	{
		"situation_description": "The service_account_email does not have a dedicated service account email provided.",
		"remedies": ["Provide a dedicated service account email for the service_account_email attribute."],
	},
	{
		"condition": "Check if the service_account_email attribute is set to a dedicated service account email.",
		"attribute_path": ["pubsub_configs", "service_account_email"],
		"values": ["service-account@project-id.iam.gserviceaccount.com"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
