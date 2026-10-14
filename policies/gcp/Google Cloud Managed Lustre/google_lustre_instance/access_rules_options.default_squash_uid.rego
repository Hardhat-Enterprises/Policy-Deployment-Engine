package terraform.gcp.security.lustre.google_lustre_instance.access_rules_options_default_squash_uid

import data.terraform.helpers
import data.terraform.gcp.security.lustre.google_lustre_instance.vars

conditions := [
    [
        {
            "situation_description": "The Lustre instance uses a default squash UID that leaves root users unsafely unmapped.",
            "remedies": [
                "Set 'default_squash_uid' to a non-zero UID.",
                "Use an explicitly configured UID such as 1000."
            ]
        },
        {
            "condition": "'default_squash_uid' must not be 0 or unset.",
            "attribute_path": ["access_rules_options", 0, "default_squash_uid"],
            "values": [0, null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details