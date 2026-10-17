package terraform.gcp.security.oracle_database.google_oracle_database_db_system.properties_ssh_public_keys

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System must have at least one SSH public key configured for secure authentication.",
            "remedies": [
                "Configure at least one valid SSH public key in ssh_public_keys."
            ]
        },
        {
            "condition": "The SSH public keys list must not be empty.",
            "attribute_path": ["properties", 0, "ssh_public_keys"],
            "values": [[], [null]],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details