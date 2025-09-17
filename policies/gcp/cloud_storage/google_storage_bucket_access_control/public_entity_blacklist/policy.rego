package terraform.gcp.security.cloud_storage.google_storage_bucket_access_control.public_entity_blacklist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket_access_control.vars

conditions := [
    [
        {
            "situation_description": "'entity' must only use approved values to avoid public access.",
            "remedies": ["Use specific users, groups, or domains instead of public entities."]
        },
        {
            "condition": "Only approved ACL entities are allowed.",
            "attribute_path": ["entity"],
            "values": [
                "allAuthenticatedUsers ",
                "allUsers"
            ],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
