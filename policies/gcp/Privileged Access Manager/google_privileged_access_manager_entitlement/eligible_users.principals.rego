package terraform.gcp.security.privileged_access_manager.google_privileged_access_manager_entitlement.eligible_users_principals

import data.terraform.helpers
import data.terraform.gcp.security.privileged_access_manager.google_privileged_access_manager_entitlement.vars

# policy_lint reports hard-coded-value on the address(es) below, and the finding
# stands. This attribute is a LIST, and the pattern policy types read the value as
# a single string (shared.get_target_list regex-matches it), so pointing one at an
# array makes it undefined -- which reads as "no violation", not as an error, and
# the non-compliant example would silently stop being flagged. There is no
# "element whitelist" type in policies/_helpers to check every element of a list
# against an allowed pattern; adding one is what would unblock this.
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
