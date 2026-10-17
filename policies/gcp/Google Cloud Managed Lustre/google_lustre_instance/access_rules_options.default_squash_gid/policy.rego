package terraform.gcp.security.lustre.google_lustre_instance.access_rules_options_default_squash_gid

import data.terraform.helpers
import data.terraform.gcp.security.lustre.google_lustre_instance.vars

conditions := [
    [
        {
            "situation_description": "The Lustre instance uses an invalid default squash GID.",
            "remedies": [
                "Set 'default_squash_gid' to a valid non-zero group ID.",
                "Use a positive numeric GID value such as 1000."
            ]
        },
        {
            "condition": "'default_squash_gid' must not be 0 or unset.",
            "attribute_path": ["access_rules_options", 0, "default_squash_gid"],
            "values": [0, null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details