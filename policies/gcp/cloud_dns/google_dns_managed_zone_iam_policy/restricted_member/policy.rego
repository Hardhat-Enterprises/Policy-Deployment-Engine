package terraform.gcp.security.cloud_dns.google_dns_managed_zone_iam_policy.restricted_member

import data.terraform.helpers
import data.terraform.gcp.security.cloud_dns.google_dns_managed_zone_iam_policy.vars

conditions := [
    [
        {
            "situation_description": "The IAM role assigned is not in the allowed list. Overly permissive roles like owner or editor must not be granted on DNS managed zones.",
            "remedies": [
                "Use only approved roles that follow the 'roles/dns.*' pattern.",
                "Remove overly permissive roles like 'roles/owner' or 'roles/editor'.",
                "Consult Google Cloud DNS IAM documentation for recommended roles."
            ]
        },
        {
            "condition": "Check if role follows the approved dns role pattern",
            "attribute_path": ["role"],
            "values": [
                "roles/*",
                [
                    ["dns.admin", "dns.reader", "dns.peer", "viewer"]
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details