package terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.condition_expression

import data.terraform.helpers
import data.terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.vars

conditions := [
    [
        {
            "situation_description": "Cloud Asset Folder Feed is using an unapproved condition expression.",
            "remedies": [
                "Set the condition expression to 'temporal_asset.deleted == false' to ensure monitoring covers active assets."
            
            ]
        },
        {
            "condition": "Checks whether the feed condition expression is in the approved list.",
            "attribute_path": ["condition", "expression"],
            "values": ["temporal_asset.deleted == false"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
