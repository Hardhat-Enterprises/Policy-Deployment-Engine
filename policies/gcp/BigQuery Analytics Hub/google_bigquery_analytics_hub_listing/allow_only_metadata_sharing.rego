package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.allow_only_metadata_sharing

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "allow_only_metadata_sharing is not enabled, exposing full data rather than metadata only",
                "remedies": ["Set allow_only_metadata_sharing to true for public or restricted listings"],
        },
        {
                "condition": "Test if allow_only_metadata_sharing is false",
                "attribute_path": ["allow_only_metadata_sharing"],
                "values": [true],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
