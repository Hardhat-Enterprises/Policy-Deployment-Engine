package terraform.gcp.security.oracle_database.google_oracle_database_db_system.properties_db_home_database_properties_database_management_config

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System must have the database_management_config block configured because its presence enables the Database Management service configuration for monitoring, diagnostics, and operational visibility.",
            "remedies": [
                "Configure the database_management_config block for the Database Management service."
            ]
        },
        {
            "condition": "The database_management_config block must be configured.",
            "attribute_path": [
                "properties",
                0,
                "db_home",
                0,
                "database",
                0,
                "properties",
                0,
                "database_management_config"
            ],
            # The block's child attributes are output-only, so block presence
            # itself is the security-relevant control.
            "values": [[], "__BLOCK_PRESENT__"],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details