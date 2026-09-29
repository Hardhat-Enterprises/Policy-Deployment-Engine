package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.location

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "location is outside the approved region whitelist",
                "remedies": ["Deploy the listing in an approved region for data residency compliance"],
        },
        {
                "condition": "Test if location is not in the approved whitelist",
                "attribute_path": ["location"],
                "values": ["us", "australia-southeast1"],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
