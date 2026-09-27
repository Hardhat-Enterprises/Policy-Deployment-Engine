package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange.location

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "BigQuery Analytics Hub data exchanges must be created only in approved locations.",
		"remedies": ["Set location to an approved region such as australia-southeast1."],
	},
	{
		"condition": "Allow only approved location values",
		"attribute_path": ["location"],
		"values": ["australia-southeast1"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
