package terraform.gcp.security.cloud_identity.google_cloud_identity_group.display_name

import data.terraform.helpers
import data.terraform.gcp.security.cloud_identity.google_cloud_identity_group.vars

conditions := [
    [
        {
            "situation_description": "Cloud Identity Group is missing a display name.",
            "remedies": [
                "Set display_name on the google_cloud_identity_group resource."
            ]
        },
        {
            "condition": "display_name must be present.",
            "attribute_path": ["display_name"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details