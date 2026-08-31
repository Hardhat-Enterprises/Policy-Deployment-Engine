package terraform.gcp.security.privileged_access_manager.google_privileged_access_manager_entitlement.eligible_users_principals

import data.terraform.helpers
import data.terraform.gcp.security.privileged_access_manager.google_privileged_access_manager_entitlement.vars

conditions := [
    [
        {
            "situation_description": "Eligible users contains principals that are not in the approved whitelist",
            "remedies": ["Replace with principals from the approved whitelist: group:authorized-admins@example.com, user:admin-user@example.com"]
        },
        {
            "condition": "Check if principals are in approved whitelist",
            "attribute_path": ["eligible_users", 0, "principals"],
            "values": ["group:authorized-admins@example.com", "user:admin-user@example.com"],
            "policy_type": "whitelist"
        }
    ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
