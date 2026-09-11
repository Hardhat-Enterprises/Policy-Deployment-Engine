package terraform.gcp.security.alloydb.google_alloydb_instance.database_flags

import data.terraform.helpers

import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [

    [
        {
            "situation_description": "AlloyDB database flags should only contain approved database-engine configuration settings.",

            "remedies": [
                "Remove unapproved database flags from the AlloyDB instance.",
                "Use only database flags approved by the organisation's security baseline."
            ]
        },

        {
            "condition": "The database_flags attribute must contain only approved database flags.",

            "attribute_path": ["database_flags"],

            "values": ["alloydb.iam_authentication"],

            "policy_type": "whitelist"
        }
    ]

]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details