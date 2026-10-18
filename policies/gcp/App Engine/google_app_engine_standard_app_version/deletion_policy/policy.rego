package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine version is not protected from deletion",
            "remedies": ["set the 'deletion_policy' attribute to 'PREVENT'"]
        },
        {
            "condition": "Require deletion protection",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details