package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.secret_manager_secret
import data.terraform.gcp.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [[
	{
		"situation_description": "Securing the secret data visibility",
		"remedies": ["Restrict access to secret data using IAM roles"],
	},
	{
		"condition": "Test if access to secret data is restricted",
		"attribute_path": ["google_secret_manager_secret_iam_member",0,"member"],
		"values": ["serviceAccount:compute@developer.gserviceaccount.com"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details