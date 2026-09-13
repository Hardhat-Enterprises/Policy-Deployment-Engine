package terraform.gcp.security.oracle_database.google_oracle_database_db_system.ssh_public_keys

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System has at least one SSH public key configured for secure authentication.",
            "remedies": [
                "Configure at least one valid SSH public key in ssh_public_keys."
            ]
        },
        {
            "condition": "At least one SSH public key must be configured for the Oracle Database DB System.",
            "attribute_path": ["properties", "ssh_public_keys"],
            "values": [[]],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details