package terraform.gcp.security.bigquery_analytics_hub.bigquery_analytics_hub_data_exchange.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_analytics_hub.bigquery_analytics_hub_data_exchange.vars

# Allowed BigQuery regions
allowed_locations := ["australia-southeast1"]

conditions := [
    [
        {
            "situation_description": "The BigQuery Analytics Hub data exchange is created in a non-approved region.",
            "remedies": ["Set the 'location' to one of the approved regions such as 'australia-southeast1'"],
        },
        {
            "condition": "Location must be one of the approved regions.",
            "attribute_path": ["location"],
            "values": allowed_locations,
            "policy_type": "whitelist",
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
