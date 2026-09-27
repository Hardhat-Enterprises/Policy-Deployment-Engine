package terraform.gcp.security.cloud_iam.google_iam_workforce_pool_provider.detailed_audit_logging

import data.terraform.helpers
import data.terraform.gcp.security.cloud_iam.google_iam_workforce_pool_provider.vars

conditions := [
    [
        {
            "situation_description": "Detailed audit logging is disabled for the workforce pool provider, reducing visibility into federated identity attribute mappings and authentication activity.",
            "remedies": [
                "Set 'detailed_audit_logging' to true."
            ]
        },
        {
            "condition": "Check whether detailed audit logging is enabled",
            "attribute_path": ["detailed_audit_logging"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
