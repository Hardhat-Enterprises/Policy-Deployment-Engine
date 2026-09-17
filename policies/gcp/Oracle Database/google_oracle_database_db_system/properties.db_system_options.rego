package terraform.gcp.security.oracle_database.google_oracle_database_db_system.properties_db_system_options
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System uses ASM storage management for the database storage.",
            "remedies": [
                "Set storage_management to ASM."
            ]
        },
        {
            "condition": "The storage management option must be ASM.",
            "attribute_path": ["properties", 0, "db_system_options", 0, "storage_management"],
            "values": ["ASM"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details