package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.log_linked_dataset_query_user_email

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "log_linked_dataset_query_user_email is not enabled, preventing attribution of subscriber queries",
                "remedies": ["Set log_linked_dataset_query_user_email to true to enable subscriber query auditing"],
        },
        {
                "condition": "Test if log_linked_dataset_query_user_email is false",
                "attribute_path": ["log_linked_dataset_query_user_email"],
                "values": [true],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
