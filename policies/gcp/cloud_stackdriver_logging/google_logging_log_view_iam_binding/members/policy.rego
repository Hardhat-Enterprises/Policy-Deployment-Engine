package terraform.gcp.security.cloud_stackdriver_logging.google_logging_log_view_iam_binding.members

import data.terraform.helpers
import data.terraform.gcp.security.cloud_stackdriver_logging.google_logging_log_view_iam.vars

conditions := [
    [
        {
            "situation_description": "Log view IAM includes public or authenticated users which exposes sensitive logs",
            "remedies": [
                "Remove 'allUsers' and 'allAuthenticatedUsers' from members",
                "Use specific service accounts or user emails instead",
                "Example: [\"serviceAccount:security-auditor@project.iam.gserviceaccount.com\"]"
            ]
        },
        {
            "condition": "Members must not include allUsers or allAuthenticatedUsers",
            "attribute_path": ["members"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details