package terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.condition

import data.terraform.helpers
import data.terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.vars

conditions := [
    [
        {
            "situation_description": "Cloud Asset Folder Feed uses an approved condition expression for security-relevant monitoring.",
            "remedies": [
                "Ensure the condition expression is configured to capture approved security-relevant asset updates."
            ]
        },
        {
            "condition": "Checks whether the feed condition expression matches the approved value.",
            "attribute_path": ["condition", 0, "expression"],
            "values": ["temporal_asset.deleted == true"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details