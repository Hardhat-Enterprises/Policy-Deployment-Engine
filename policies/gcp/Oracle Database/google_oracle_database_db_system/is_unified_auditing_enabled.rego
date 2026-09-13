package terraform.gcp.security.oracle_database.google_oracle_database_db_system.is_unified_auditing_enabled

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System has unified auditing enabled to improve security event auditing and monitoring.",
            "remedies": [
                "Set is_unified_auditing_enabled to true."
            ]
        },
        {
            "condition": "Unified auditing must be enabled.",
            "attribute_path": ["properties", 0, "db_home", 0, "is_unified_auditing_enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details