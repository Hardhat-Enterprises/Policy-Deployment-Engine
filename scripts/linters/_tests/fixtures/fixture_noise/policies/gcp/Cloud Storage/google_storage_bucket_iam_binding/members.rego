package terraform.gcp.security.cloud_storage.google_storage_bucket_iam_binding.members

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "Access is granted to the whole internet.",
            "remedies": ["Remove allUsers and allAuthenticatedUsers from members."]
        },
        {
            "condition": "Public access should be prohibited.",
            "attribute_path": ["members"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "element blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
