package terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.condition_expression

import data.terraform.helpers
import data.terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.vars

conditions := [
    [
        {
            "situation_description": "Cloud Asset Folder Feed is using an unapproved condition expression.",
            "remedies": [
                "Set the condition expression to an approved value for security-relevant monitoring."
            ]
        },
        {
            "condition": "Checks whether the feed condition expression is in the approved list.",
            "attribute_path": ["condition", 0, "expression"],
            "values": ["temporal_asset.deleted == true"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details