package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange.discovery_type

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "BigQuery Analytics Hub data exchanges must use an approved discovery_type.",
		"remedies": [
			"Set discovery_type to an approved value such as DISCOVERY_TYPE_PRIVATE.",
			"If you are using a Data Clean Room (sharing_environment_config.dcr_exchange_config), remove discovery_type because it cannot be set for DCR exchanges.",
		],
	},
	{
		"condition": "Allow only approved discovery_type values",
		"attribute_path": ["discovery_type"],
		"values": ["DISCOVERY_TYPE_PRIVATE"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
