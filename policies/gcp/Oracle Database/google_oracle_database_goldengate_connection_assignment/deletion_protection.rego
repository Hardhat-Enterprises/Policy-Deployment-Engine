package terraform.gcp.security.oracle_database.google_oracle_database_goldengate_connection_assignment.deletion_protection

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_goldengate_connection_assignment.vars

conditions := [
    [
        {
            "situation_description": "The Goldengate connection assignment has deletion protection enabled to prevent accidental or unauthorized deletion.",
            "remedies": [
                "Set deletion_protection to true."
            ]
        },
        {
            "condition": "Deletion protection must be enabled to prevent the resource from being destroyed through Terraform.",
            "attribute_path": ["deletion_protection"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details