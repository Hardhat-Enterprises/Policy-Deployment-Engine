package terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.pubsub_destination

import data.terraform.helpers
import data.terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.vars

conditions := [
    [
        {
            "situation_description": "Cloud Asset Folder Feed uses the approved Pub/Sub destination topic.",
            "remedies": [
                "Ensure the Pub/Sub destination topic uses the approved full topic path."
            ]
        },
        {
            "condition": "Checks whether the Pub/Sub topic matches the approved topic path.",
            "attribute_path": ["feed_output_config", 0, "pubsub_destination", 0, "topic"],
            "values": ["projects/projectExample/topics/topicExample"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details