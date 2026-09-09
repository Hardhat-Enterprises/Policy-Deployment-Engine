package terraform.gcp.security.container_attached.google_container_attached_cluster.authorization_admin_groups

import data.terraform.helpers
import data.terraform.gcp.security.container_attached.google_container_attached_cluster.vars

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
