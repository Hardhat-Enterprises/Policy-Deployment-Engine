package terraform.gcp.security.bigquery_analytics_hub.bigquery_analytics_hub_data_exchange.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_analytics_hub.bigquery_analytics_hub_data_exchange.vars

# List of regions that are allowed for creating a data exchange
allowed_locations := ["australia-southeast1"]

conditions := [[
	{
		"situation_description": "The BigQuery Analytics Hub data exchange is created in a location that is not in the approved list.",
		"remedies": ["Set the 'location' argument to one of the approved regions, such as 'australia-southeast1'."],
	},
	{
		"condition": "Verify that the value set for 'location' is included in the approved list of regions.",
		"attribute_path": ["location"],
		"values": allowed_locations,
		"policy_type": "whitelist",
	},
]]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details