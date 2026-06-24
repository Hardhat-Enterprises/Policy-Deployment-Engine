package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.restricted_export_config_enabled

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "Listing does not have restricted_export_config enabled.",
		"remedies": [
			"Set restricted_export_config { enabled = true } on the listing.",
			"Optionally set restrict_query_result = true.",
		],
	},
	{
		"condition": "restricted_export_config must exist",
		"attribute_path": ["restricted_export_config"],
		"values": [null, []],
		"policy_type": "blacklist",
	},
	{
		"condition": "restricted_export_config.enabled must be true",
		"attribute_path": ["restricted_export_config", 0, "enabled"],
		"values": [true],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
