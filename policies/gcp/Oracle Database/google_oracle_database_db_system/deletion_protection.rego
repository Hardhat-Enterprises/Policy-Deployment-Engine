package terraform.gcp.security.oracle_database.google_oracle_database_db_system.deletion_protection

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System has deletion protection enabled to prevent accidental destruction of the resource.",
            "remedies": [
                "Set deletion_protection to true."
            ]
        },
        {
            "condition": "Deletion protection must be enabled to prevent the Oracle Database DB System from being destroyed.",
            "attribute_path": ["deletion_protection"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details