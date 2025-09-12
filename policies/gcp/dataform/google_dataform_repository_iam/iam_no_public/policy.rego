package terraform.gcp.security.dataform.google_dataform_repository_iam.iam_no_public

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository_iam.vars

conditions := [
    [
        {"situation_description" : "Repository IAM bindings must not include allUsers",
        "remedies": ["Remove allUsers from members"]},
        {
            "condition": "Disallow allUsers member",
            "attribute_path" : ["members", 0],
            "policy_type" : "blacklist",
            "values" : ["allUsers"]
        },
        {
            "condition": "Disallow allUsers member",
            "attribute_path" : ["members", 1],
            "policy_type" : "blacklist",
            "values" : ["allUsers"]
        },
        {
            "condition": "Disallow allUsers member",
            "attribute_path" : ["members", 2],
            "policy_type" : "blacklist",
            "values" : ["allUsers"]
        }
    ]
    ,
    [
        {"situation_description" : "Only approved roles may be bound at repository scope",
        "remedies": ["Use approved role mappings or custom org roles"]},
        {
            "condition": "Restrict role allowlist",
            "attribute_path" : ["role"],
            "policy_type" : "whitelist",
            "values" : ["roles/dataform.admin", "roles/dataform.editor", "roles/dataform.viewer"]
        }
    ]
    ,
    [
        {"situation_description" : "Member principal type must be allowed",
        "remedies": ["Normalize identities to supported types (user/serviceAccount/group/domain)"]},
        {
            "condition": "Member[0] prefix allowlist",
            "attribute_path" : ["members", 0],
            "policy_type" : "pattern whitelist",
            "values" : ["user:", "serviceAccount:", "group:", "domain:"]
        },
        {
            "condition": "Member[1] prefix allowlist",
            "attribute_path" : ["members", 1],
            "policy_type" : "pattern whitelist",
            "values" : ["user:", "serviceAccount:", "group:", "domain:"]
        },
        {
            "condition": "Member[2] prefix allowlist",
            "attribute_path" : ["members", 2],
            "policy_type" : "pattern whitelist",
            "values" : ["user:", "serviceAccount:", "group:", "domain:"]
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


