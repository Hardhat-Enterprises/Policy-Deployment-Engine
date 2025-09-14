package terraform.gcp.security.integration_connectors.google_integration_connectors_endpoint.service_attachment
import data.terraform.gcp.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_endpoint.vars

conditions := [[
	{
		"situation_description": "Enforce that service attachment comes from approved projects",
		"remedies": ["service attachment must come from approved projects"],
	},
	{
		"condition": "Test if service attachment comes from approved projects",
		"attribute_path": ["service_attachment"],
		"values": ["projects/connectors-example/regions/us-central1/serviceAttachments/test"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
