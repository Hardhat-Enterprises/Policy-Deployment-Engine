package terraform.gcp.security.lustre.google_lustre_instance.access_rules_options_default_squash_uid

import data.terraform.helpers
import data.terraform.gcp.security.lustre.google_lustre_instance.vars

conditions := [
    [
        {
            "situation_description": "The Lustre instance uses an invalid default squash UID.",
            "remedies": [
                "Set 'default_squash_uid' to a valid non-zero user ID.",
                "Use a positive numeric UID value such as 1000."
            ]
        },
        {
            "condition": "'default_squash_uid' must not be 0.",
            "attribute_path": ["access_rules_options", 0, "default_squash_uid"],
            "values": [0],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details