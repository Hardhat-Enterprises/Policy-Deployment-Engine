package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue_iam_binding.members

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue_iam_binding.vars

conditions := [

    [
        {
            "situation_description": "Cloud Tasks Queue IAM allows public access",
            "remedies": [
                "Remove allUsers from members",
                "Restrict access to specific identities"
            ]
        },
        {
            "condition": "Checks if allUsers is allowed",
            "attribute_path": ["members"],
            "values": ["allUsers"],
            "policy_type": "blacklist"
        }
    ],

    [
        {
            "situation_description": "Cloud Tasks Queue IAM allows all authenticated users access",
            "remedies": [
                "Remove allAuthenticatedUsers",
                "Grant access only to required users"
            ]
        },
        {
            "condition": "Checks if allAuthenticatedUsers is allowed",
            "attribute_path": ["members"],
            "values": ["allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]

]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
