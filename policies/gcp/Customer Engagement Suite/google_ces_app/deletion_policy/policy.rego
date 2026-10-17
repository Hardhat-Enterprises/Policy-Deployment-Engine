package terraform.gcp.security.customer_engagement_suite.google_ces_app.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
        {
            "situation_description": "CES applications must prevent destructive deletion.",
            "remedies": ["Set deletion_policy to PREVENT."]
        },
        {
            "condition": "Deletion policy must prevent resource destruction.",
            "attribute_path": ["deletion_policy"],
            "values": ["DELETE", "ABANDON"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details