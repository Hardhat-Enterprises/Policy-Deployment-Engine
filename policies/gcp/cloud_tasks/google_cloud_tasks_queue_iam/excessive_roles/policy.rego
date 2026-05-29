package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue_iam.excessive_roles

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue_iam.vars

conditions := [

    # Owner role
    [
        {
            "situation_description": "Cloud Tasks Queue IAM grants owner privileges",
            "remedies": [
                "Avoid using roles/owner",
                "Apply least privilege access"
            ]
        },
        {
            "condition": "Checks if roles/owner is used",
            "attribute_path": ["role"],
            "values": ["roles/owner"],
            "policy_type": "blacklist"
        }
    ],

    # Editor role
    [
        {
            "situation_description": "Cloud Tasks Queue IAM grants editor privileges",
            "remedies": [
                "Avoid using roles/editor",
                "Use more restrictive roles such as viewer or custom roles"
            ]
        },
        {
            "condition": "Checks if roles/editor is used",
            "attribute_path": ["role"],
            "values": ["roles/editor"],
            "policy_type": "blacklist"
        }
    ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details