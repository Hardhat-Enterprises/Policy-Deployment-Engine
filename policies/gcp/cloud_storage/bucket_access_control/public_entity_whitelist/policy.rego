package terraform.gcp.security.cloud_storage.bucket_access_control.public_entity_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.bucket_access_control.vars

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
                "user:user@example.com",
                "group:admins@example.com",
                "domain:example.com"
            ],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
