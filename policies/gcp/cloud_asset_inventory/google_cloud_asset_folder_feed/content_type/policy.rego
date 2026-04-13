package terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.content_type

import data.terraform.helpers
import data.terraform.gcp.security.cloud_asset_inventory.google_cloud_asset_folder_feed.vars

conditions := [
    [
        {
            "situation_description": "Cloud Asset folder feed uses an unapproved content type and may not capture security-relevant asset updates",
            "remedies": [
                "Set content_type to an approved security-relevant value",
                "Use RESOURCE, IAM_POLICY, ORG_POLICY, or ACCESS_POLICY based on monitoring requirements"
            ]
        },
        {
            "condition": "content_type must be an approved value",
            "attribute_path": ["content_type"],
            "values": ["RESOURCE", "IAM_POLICY", "ORG_POLICY", "ACCESS_POLICY"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details