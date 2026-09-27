package terraform.gcp.security.oracle_database.google_oracle_database_db_system.properties_db_home_database_tde_wallet_password

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System must not use an inline cleartext TDE wallet password. The credential should be provided through an approved external secret-management reference.",
            "remedies": [
                "Replace the inline TDE wallet password with a Google Cloud Secret Manager reference using the format projects/PROJECT_ID/secrets/SECRET_ID/versions/VERSION_ID."
            ]
        },
        {
            "condition": "The TDE wallet password must use a Google Cloud Secret Manager resource reference.",
            "attribute_path": [
                "properties",
                0,
                "db_home",
                0,
                "database",
                0,
                "tde_wallet_password"
            ],
            "values": [
                "projects/*/secrets/*/versions/*"
            ],
            "policy_type": "element pattern whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details