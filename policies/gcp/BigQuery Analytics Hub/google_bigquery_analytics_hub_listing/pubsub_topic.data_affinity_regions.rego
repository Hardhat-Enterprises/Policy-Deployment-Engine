package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.pubsub_topic_data_affinity_regions

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "pubsub_topic.data_affinity_regions includes a region outside the approved whitelist",
                "remedies": ["Restrict data_affinity_regions to approved regions for data residency compliance"],
        },
        {
                "condition": "Test if data_affinity_regions contains a non-approved region",
                "attribute_path": ["pubsub_topic", 0, "data_affinity_regions"],
                "values": ["us-central1", "australia-southeast1"],
                "policy_type": "element pattern whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
