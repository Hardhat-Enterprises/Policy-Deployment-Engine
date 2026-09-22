package terraform.gcp.security.oracle_database.google_oracle_database_db_system.location

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System has a valid GCP location configured.",
            "remedies": [
                "Set location to a valid GCP region."
            ]
        },
        {
            "condition": "The location must be a valid GCP region.",
            "attribute_path": ["location"],
            "values": ["invalid-location"],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details