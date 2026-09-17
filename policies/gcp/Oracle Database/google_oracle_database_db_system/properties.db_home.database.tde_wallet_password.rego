package terraform.gcp.security.oracle_database.google_oracle_database_db_system.properties_db_home_database_tde_wallet_password

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database has a TDE wallet password configured to protect the database encryption wallet.",
            "remedies": [
                "Configure a secure TDE wallet password."
            ]
        },
        {
            "condition": "The TDE wallet password must not use an invalid placeholder value.",
            "attribute_path": ["properties", 0, "db_home", 0, "database", 0, "tde_wallet_password"],
            "values": ["invalid-wallet-password"],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details