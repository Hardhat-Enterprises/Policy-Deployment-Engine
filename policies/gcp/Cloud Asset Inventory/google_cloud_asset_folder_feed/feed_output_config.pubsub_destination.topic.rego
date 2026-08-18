package terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.feed_output_config_pubsub_destination_topic

import data.terraform.helpers
import data.terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.vars

conditions := [
    [
        {
            "situation_description": "Cloud Asset Folder Feed is using an unapproved Pub/Sub destination topic.",
            "remedies": [
                "Set the Pub/Sub destination topic to an approved value for security-relevant monitoring."
            ]
        },
        {
            "condition": "Checks whether the Pub/Sub destination topic is in the approved list.",
            "attribute_path": ["feed_output_config", 0, "pubsub_destination", 0, "topic"],
            "values": ["projects/projectExample/topics/topicExample"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
