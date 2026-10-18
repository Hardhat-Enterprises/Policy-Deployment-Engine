package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.bigquery_dataset_replica_locations

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "bigquery_dataset.replica_locations includes a region outside the approved whitelist",
                "remedies": ["Restrict replica_locations to approved regions for data residency compliance"],
        },
        {
                "condition": "Test if replica_locations contains a non-approved region",
                "attribute_path": ["bigquery_dataset", 0, "replica_locations"],
                "values": ["us-central1", "australia-southeast1"],
                "policy_type": "element pattern whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
