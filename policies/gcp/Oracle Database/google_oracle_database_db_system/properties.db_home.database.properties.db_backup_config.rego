package terraform.gcp.security.oracle_database.google_oracle_database_db_system.properties_db_home_database_properties_db_backup_config
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database has automatic backups enabled to support recovery from data loss or database failure.",
            "remedies": [
                "Set auto_backup_enabled to true."
            ]
        },
        {
            "condition": "Automatic database backups must be enabled.",
            "attribute_path": ["properties", 0, "db_home", 0, "database", 0, "properties", 0, "db_backup_config", 0, "auto_backup_enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details