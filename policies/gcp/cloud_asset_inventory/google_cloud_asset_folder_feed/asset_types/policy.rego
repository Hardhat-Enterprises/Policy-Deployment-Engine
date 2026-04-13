package terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.asset_types

import data.terraform.helpers
import data.terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.vars

conditions := [
    [
        {
            "situation_description": "Cloud Asset Folder Feed monitors approved asset types.",
            "remedies": [
                "Ensure the feed includes only approved asset types for security monitoring."
            ]
        },
        {
            "condition": "Checks whether the asset type matches the approved value.",
            "attribute_path": ["asset_types", 0],
            "values": ["compute.googleapis.com/Instance"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details