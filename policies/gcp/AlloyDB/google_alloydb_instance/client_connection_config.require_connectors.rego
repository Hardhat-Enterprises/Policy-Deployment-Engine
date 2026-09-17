package terraform.gcp.security.google_alloydb_instance.client_connection_config.require_connectors

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [
    [
        {
            "situation_description": "The AlloyDB instance should require connections through approved AlloyDB connectors to reduce direct database exposure.",
            "remedies": [
                "Enable connector-only connections for the AlloyDB instance.",
                "Set client_connection_config.require_connectors to true."
            ]
        },
        {
            "condition": "The require_connectors attribute must be set to true.",
            "attribute_path": [
                "client_connection_config",
                0,
                "require_connectors"
            ],
            "values": [
                true
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details