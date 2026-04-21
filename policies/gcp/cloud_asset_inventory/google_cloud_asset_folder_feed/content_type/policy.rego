package terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.content_type

import data.terraform.helpers
import data.terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.vars

conditions := [
    [
        {
            "situation_description": "Cloud Asset Folder Feed is using an unapproved content type.",
            "remedies": [
                "Set the content_type to an approved value for security-relevant monitoring.",
                "Use RESOURCE, IAM_POLICY, ORG_POLICY, or ACCESS_POLICY based on monitoring requirements"
            ]
        },
        {
            "condition": "Checks whether the content_type is in the approved list.",
            "attribute_path": ["content_type"],
            "values": ["RESOURCE", "IAM_POLICY", "ORG_POLICY", "ACCESS_POLICY"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
