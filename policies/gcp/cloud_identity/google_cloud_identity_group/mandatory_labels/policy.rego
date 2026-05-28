package terraform.gcp.security.cloud_identity.google_cloud_identity_group.mandatory_labels

import data.terraform.helpers
import data.terraform.gcp.security.cloud_identity.google_cloud_identity_group.vars

conditions := [
    [
        {
            "situation_description": "Cloud Identity Group is missing mandatory label 'env'.",
            "remedies": ["Add the 'env' label to the group's labels block."]
        },
        {
            "condition": "Check for mandatory env label",
            "attribute_path": ["labels", "env"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
