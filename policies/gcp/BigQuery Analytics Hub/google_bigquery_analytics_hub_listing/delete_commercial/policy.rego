package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.delete_commercial

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "delete_commercial is pre-set to true, bypassing the built-in delete confirmation guard",
                "remedies": ["Leave delete_commercial false or unset to preserve the accidental-deletion safeguard"],
        },
        {
                "condition": "Test if delete_commercial is true",
                "attribute_path": ["delete_commercial"],
                "values": [true],
                "policy_type": "blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
