package terraform.gcp.security.lustre.google_lustre_instance.access_rules_options_access_rules_squash_mode

import data.terraform.helpers
import data.terraform.gcp.security.lustre.google_lustre_instance.vars

conditions := [
    [
        {
            "situation_description": "The Lustre access rule does not protect root users from retaining unrestricted privileges.",
            "remedies": [
                "Set 'squash_mode' = \"ROOT_SQUASH\" for each access rule."
            ]
        },
        {
            "condition": "'squash_mode' must be set to ROOT_SQUASH.",
            "attribute_path": ["access_rules_options", 0, "access_rules", 0, "squash_mode"],
            "values": ["ROOT_SQUASH"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details