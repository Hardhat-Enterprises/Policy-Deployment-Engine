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
            "values" : ["allUsers"],
            "policy_type" : "blacklist"
        },
        {
            "condition": "Disallow allUsers member",
            "attribute_path" : ["members", 1],
            "values" : ["allUsers"],
            "policy_type" : "blacklist"
        },
        {
            "condition": "Disallow allUsers member",
            "attribute_path" : ["members", 2],
            "values" : ["allUsers"],
            "policy_type" : "blacklist"
        }
    ]
    ,
    [
        {"situation_description" : "Only approved roles may be bound at repository scope",
        "remedies": ["Use approved role mappings or custom org roles"]},
        {
            "condition": "Restrict role allowlist",
            "attribute_path" : ["role"],
            "values" : ["roles/dataform.admin", "roles/dataform.editor", "roles/dataform.viewer"],
            "policy_type" : "whitelist"
        }
    ]
    ,
    [
        {"situation_description" : "Member principal type must be allowed",
        "remedies": ["Normalize identities to supported types (user/serviceAccount/group/domain)"]},
        {
            "condition": "Member[0] prefix allowlist",
            "attribute_path" : ["members", 0],
            "values" : ["user:", "serviceAccount:", "group:", "domain:"],
            "policy_type" : "pattern whitelist"
        },
        {
            "condition": "Member[1] prefix allowlist",
            "attribute_path" : ["members", 1],
            "values" : ["user:", "serviceAccount:", "group:", "domain:"],
            "policy_type" : "pattern whitelist"
        },
        {
            "condition": "Member[2] prefix allowlist",
            "attribute_path" : ["members", 2],
            "values" : ["user:", "serviceAccount:", "group:", "domain:"],
            "policy_type" : "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


