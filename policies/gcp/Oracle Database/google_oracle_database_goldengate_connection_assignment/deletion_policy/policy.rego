package terraform.gcp.security.oracle_database.google_oracle_database_goldengate_connection_assignment.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_goldengate_connection_assignment.vars

conditions := [
    [
        {
            "situation_description": "The Goldengate connection assignment has a deletion policy that prevents accidental deletion of the resource.",
            "remedies": [
                "Set deletion_policy to PREVENT."
            ]
        },
        {
            "condition": "The deletion policy must be PREVENT to prevent the Goldengate connection assignment from being deleted.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details