package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.restricted_export_config_restrict_query_result

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "restricted_export_config.restrict_query_result is not enabled, allowing export of derived query results",
                "remedies": ["Set restricted_export_config.restrict_query_result to true to prevent export of derived query results"],
        },
        {
                "condition": "restricted_export_config must exist",
                "attribute_path": ["restricted_export_config"],
                "values": [null, []],
                "policy_type": "blacklist",
        },
        {
                "condition": "restrict_query_result must be true",
                "attribute_path": ["restricted_export_config", 0, "restrict_query_result"],
                "values": [true],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
