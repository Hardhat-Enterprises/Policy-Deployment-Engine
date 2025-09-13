package terraform.gcp.security.privileged_access_manager.entitlement.eligible_users

import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
    [
        {
            "situation_description": "Eligible users contains overly broad principals that allow public access",
            "remedies": ["Replace broad principals with specific users/groups/service accounts"]
        },
        {
            "condition": "Check for allUsers or allAuthenticatedUsers principal",
            "attribute_path": ["eligible_users", 0, "principals"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Eligible users contains invalid IAM principal formats",
            "remedies": ["Use proper prefixes: user:, group:, serviceAccount:"]
        },
        {
            "condition": "Check for principals with proper IAM prefix",
            "attribute_path": ["eligible_users", "*", "principals"],
            "values": ["user:", "group:", "serviceAccount:"],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details