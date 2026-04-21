package terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.asset_types

import data.terraform.helpers
import data.terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.vars

conditions := [
    [
        {
            "situation_description": "Cloud Asset Folder Feed is using an unapproved asset type.",
            "remedies": [
                "Set asset_types to approved values for security monitoring."
            ]
        },
        {
            "condition": "Checks whether the asset type is in the approved list.",
            "attribute_path": ["asset_types"],
            "values": ["compute.googleapis.com/Instance"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
