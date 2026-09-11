package terraform.gcp.security.alloydb.google_alloydb_instance.database_flags

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [
    [
        {
            "situation_description": "AlloyDB IAM authentication should be enabled.",

            "remedies": [
                "Set alloydb.iam_authentication to on.",
                "Do not disable AlloyDB IAM authentication."
            ]
        },

        {
            "condition": "The alloydb.iam_authentication database flag must be set to on.",

            "attribute_path": ["database_flags"],

            "values": [
                {
                    "alloydb.iam_authentication": "on"
                }
            ],

            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details