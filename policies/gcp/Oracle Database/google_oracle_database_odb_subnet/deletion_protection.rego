package terraform.gcp.security.oracle_database.google_oracle_database_odb_subnet.deletion_protection

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_odb_subnet.vars

conditions := [
    [
        {
            "situation_description": "The ODB subnet must have deletion protection enabled to prevent accidental or unauthorized destruction.",
            "remedies": [
                "Set deletion_protection to true."
            ]
        },
        {
            "condition": "Deletion protection must be enabled for the ODB subnet.",
            "attribute_path": ["deletion_protection"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details