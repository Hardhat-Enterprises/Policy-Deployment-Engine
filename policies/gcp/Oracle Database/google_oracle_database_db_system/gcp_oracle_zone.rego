package terraform.gcp.security.oracle_database.google_oracle_database_db_system.gcp_oracle_zone

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System has a valid GCP Oracle zone configured.",
            "remedies": [
                "Set gcp_oracle_zone to a valid GCP Oracle zone."
            ]
        },
        {
            "condition": "The GCP Oracle zone must be a valid Oracle zone.",
            "attribute_path": ["gcp_oracle_zone"],
            "values": ["invalid-zone"],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details