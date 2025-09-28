package terraform.gcp.security.analytics_hub.listing_iam.restrict_risky_members

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.listing_iam.vars

conditions := [
    [
        {
            "situation_description": "c2: IAM members must not include risky principals (allUsers, allAuthenticatedUsers) and list must not be empty",
            "remedies": [
                "Remove allUsers/allAuthenticatedUsers and assign roles only to specific users, groups, or service accounts",
                "Ensure members attribute is not empty"
            ]
        },
        {
            "condition": "Check IAM members for risky principals or empty list",
            "attribute_path": ["members"],
            "values": ["", "allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

# Compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance report
details := helpers.get_multi_summary(conditions, vars.variables).details
