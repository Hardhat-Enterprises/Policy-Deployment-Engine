package terraform.gcp.security.oracle_database.google_oracle_database_db_system.backup_destination_details

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database backup configuration uses an approved backup destination to support secure and resilient data recovery.",
            "remedies": [
                "Set the backup destination type to OBJECT_STORE."
            ]
        },
        {
            "condition": "The backup destination type must be OBJECT_STORE.",
            "attribute_path": ["properties", 0, "db_home", 0, "database", 0, "properties", 0, "db_backup_config", 0, "backup_destination_details", 0, "type"],
            "values": ["OBJECT_STORE"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details