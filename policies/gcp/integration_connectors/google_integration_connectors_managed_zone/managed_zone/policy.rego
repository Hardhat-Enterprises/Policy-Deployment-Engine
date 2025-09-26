package terraform.gcp.security.integration_connectors.google_integration_connectors_managed_zone.managed_zone
import data.terraform.gcp.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_managed_zone.vars

conditions := [[
	{
		"situation_description": "securing the visibility of Managed Zone",
		"remedies": ["Set visibility to private for Managed Zone" ],
	},
	{
		"condition": "Test if visibility is set to private",
		"attribute_path": ["visibility"],
		"values": ["private"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details