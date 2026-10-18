package terraform.gcp.security.lustre.google_lustre_instance.access_rules_options_default_squash_mode

import data.terraform.helpers
import data.terraform.gcp.security.lustre.google_lustre_instance.vars

conditions := [
    [
        {
            "situation_description": "The Lustre instance default squash mode does not protect root users from unmatched clients.",
            "remedies": [
                "Set 'default_squash_mode' = \"ROOT_SQUASH\" to restrict root privileges for unmatched clients."
            ]
        },
        {
            "condition": "'default_squash_mode' must be set to ROOT_SQUASH.",
            "attribute_path": ["access_rules_options", 0, "default_squash_mode"],
            "values": ["ROOT_SQUASH"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details