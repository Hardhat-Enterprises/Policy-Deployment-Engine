package terraform.gcp.security.cloud_identity.google_cloud_identity_group.labels

import data.terraform.helpers
import data.terraform.gcp.security.cloud_identity.google_cloud_identity_group.vars

conditions := [
    [
        {
            "situation_description": "Cloud Identity Group must define the 'cloudidentity.googleapis.com/groups.discussion_forum' label with an empty value.",
            "remedies": ["Set labels[\"cloudidentity.googleapis.com/groups.discussion_forum\"] to an empty string."]
        },
        {
            "condition": "Check required discussion_forum label is set to an empty string",
            "attribute_path": ["labels", "cloudidentity.googleapis.com/groups.discussion_forum"],
            "values": [""],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
