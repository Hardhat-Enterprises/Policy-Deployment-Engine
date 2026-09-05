package terraform.gcp.security.oracle_database.google_oracle_database_odb_subnet.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_odb_subnet.vars

conditions := [
    [
        {
            "situation_description": "The ODB subnet must be protected from deletion by Terraform.",
            "remedies": [
                "Set deletion_policy to PREVENT."
            ]
        },
        {
            "condition": "The deletion policy must prevent Terraform from deleting the ODB subnet.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details