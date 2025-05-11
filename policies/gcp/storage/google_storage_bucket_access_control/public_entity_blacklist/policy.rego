package terraform.gcp.security.storage.google_storage_bucket_access_control.public_entity_blacklist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.google_storage_bucket_access_control.vars

conditions := [
    [
        {
            "situation_description": "Bucket ACL grants access to 'allUsers' or 'allAuthenticatedUsers'.",
            "remedies": ["Avoid using public entities in ACLs. Use IAM policies instead."]
        },
        {
            "condition": "Disallow public ACL entities",
            "attribute_path": ["entity"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
