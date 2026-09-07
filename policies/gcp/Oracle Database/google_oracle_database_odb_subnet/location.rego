package terraform.gcp.security.oracle_database.google_oracle_database_odb_subnet.location

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_odb_subnet.vars

conditions := [
    [
        {
            "situation_description": "The ODB subnet must be deployed in an approved Google Cloud region to support data residency requirements.",
            "remedies": [
                "Set location to an approved region."
            ]
        },
        {
            "condition": "The ODB subnet location must be an approved region.",
            "attribute_path": ["location"],
            "values": [
                "australia-southeast1",
                "australia-southeast2"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details