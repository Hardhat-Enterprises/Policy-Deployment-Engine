package terraform.gcp.security.oracle_database.google_oracle_database_db_system.license_model

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System has an explicitly defined and approved license model.",
            "remedies": [
                "Set license_model to LICENSE_INCLUDED or BRING_YOUR_OWN_LICENSE."
            ]
        },
        {
            "condition": "The license model must be explicitly set to an approved value.",
            "attribute_path": ["properties", "license_model"],
            "values": ["LICENSE_INCLUDED", "BRING_YOUR_OWN_LICENSE"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details