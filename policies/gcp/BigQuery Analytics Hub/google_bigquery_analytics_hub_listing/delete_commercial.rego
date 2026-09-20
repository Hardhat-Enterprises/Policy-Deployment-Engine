package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.delete_commercial

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "delete_commercial safety guard is not set to true",
                "remedies": ["Set delete_commercial to true to protect against accidental deletion of commercial listings"],
        },
        {
                "condition": "Test if delete_commercial is not true",
                "attribute_path": ["delete_commercial"],
                "values": [true],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
