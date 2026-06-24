package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_subscription.destination_dataset_labels

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_subscription.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "Destination dataset must include a non-empty 'environment' label for Analytics Hub Listing Subscriptions.",
		"remedies": [
			"Add destination_dataset.labels.environment (e.g., dev/test/stage/prod).",
			"Ensure the value is not an empty string.",
		],
	},
	{
		"condition": "Disallow missing or empty destination_dataset.labels.environment",
		"attribute_path": ["destination_dataset", 0, "labels", "environment"],
		"values": ["", null],
		"policy_type": "blacklist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
