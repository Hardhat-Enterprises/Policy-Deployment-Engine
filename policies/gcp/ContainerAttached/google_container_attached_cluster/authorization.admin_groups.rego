package terraform.gcp.security.container_attached.google_container_attached_cluster.authorization_admin_groups

import data.terraform.helpers
import data.terraform.gcp.security.container_attached.google_container_attached_cluster.vars

conditions := [
    [
        {
            "situation_description": "Cluster admin groups contain unapproved domains or personal email accounts. This violates the principle of least privilege and centralized identity management.",
            "remedies": [
                "Ensure all entries in authorization.admin_groups.groups end with '@company.com'.",
                "Remove any wildcard '*' entries.",
                "Use corporate groups instead of individual personal email addresses."
            ]
        },
        {
            "condition": "Verify admin groups follow the corporate domain pattern",
            "attribute_path": ["authorization", 0,"admin_groups"],
            "values": [
                "abc@company.com",
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
