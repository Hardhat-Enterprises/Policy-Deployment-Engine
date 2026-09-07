package terraform.gcp.security.oracle_database.google_oracle_database_goldengate_connection_assignment.location

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_goldengate_connection_assignment.vars

conditions := [
    [
        {
            "situation_description": "The Goldengate connection assignment is deployed in an approved region to support data residency requirements.",
            "remedies": [
                "Set location to an approved region such as australia-southeast1."
            ]
        },
        {
            "condition": "The resource location must be within the approved region whitelist.",
            "attribute_path": ["location"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details