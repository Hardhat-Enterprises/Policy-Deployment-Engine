package terraform.gcp.security.google_endpoints.google_endpoints_consumers_iam.members

import data.terraform.helpers
import data.terraform.gcp.security.google_endpoints.google_endpoints_consumers_iam.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints consumers IAM members includes a principal outside the approved member types.",
            "remedies": [
                "Use only approved member types in members.",
                "Allow only user:, group:, or serviceAccount: principals."
            ]
        },
        {
            "condition": "Check that members only use approved principal types.",
            "attribute_path": ["members"],
            "values": ["*", [["user","group","serviceAccount"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
