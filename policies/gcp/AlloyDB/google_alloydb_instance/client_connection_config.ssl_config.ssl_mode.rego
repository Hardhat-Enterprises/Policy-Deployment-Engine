package terraform.gcp.security.google_alloydb_instance.client_connection_config.ssl_config.ssl_mode

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [
    [
        {
            "situation_description": "The AlloyDB instance should require encrypted client-server connections to protect database traffic from exposure.",
            "remedies": [
                "Configure the AlloyDB instance to require encrypted client-server connections.",
                "Set client_connection_config.ssl_config.ssl_mode to ENCRYPTED_ONLY."
            ]
        },
        {
            "condition": "The ssl_mode attribute must be set to ENCRYPTED_ONLY.",
            "attribute_path": [
                "client_connection_config",
                0,
                "ssl_config",
                0,
                "ssl_mode"
            ],
            "values": [
                "ENCRYPTED_ONLY"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details