package terraform.gcp.security.oracle_database.google_oracle_database_db_system.database_gcp_oracle_zone

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database has a valid GCP Oracle zone configured for the database.",
            "remedies": [
                "Set the database gcp_oracle_zone to a valid Oracle zone."
            ]
        },
        {
            "condition": "The database GCP Oracle zone must not use an invalid zone value.",
            "attribute_path": [
                "properties",
                0,
                "db_home",
                0,
                "database",
                0,
                "gcp_oracle_zone"
            ],
            "values": [
                "invalid-zone"
            ],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details