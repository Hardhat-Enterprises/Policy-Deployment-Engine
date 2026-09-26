package terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.feed_output_config_pubsub_destination_topic

import data.terraform.helpers
import data.terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.vars

# policy_lint reports hard-coded-value on the value below, and the finding stands.
# A pattern whitelist only judges values that MATCH its target: one that does not
# match the shape is never flagged at all. This argument's non-compliant example
# is a bare topic name with no "projects/.../topics/" path, so converting would make the fixture pass for the wrong
# reason. Either _helpers needs a pattern whitelist that fails a non-matching
# value, or the fixture needs a wrongly-scoped (not malformed) example.
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
