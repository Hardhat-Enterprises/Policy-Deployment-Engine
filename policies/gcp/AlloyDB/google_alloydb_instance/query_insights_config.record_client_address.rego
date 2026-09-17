package terraform.gcp.security.google_alloydb_instance.query_insights_config.record_client_address

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [
    [
        {
            "situation_description": "The AlloyDB instance should record client addresses in Query Insights to support security monitoring and audit visibility.",
            "remedies": [
                "Enable client address recording in Query Insights.",
                "Set query_insights_config.record_client_address to true.",
                "Ensure recorded client-address information is handled according to applicable privacy and data-protection requirements."
            ]
        },
        {
            "condition": "The record_client_address attribute must be set to true.",
            "attribute_path": [
                "query_insights_config",
                0,
                "record_client_address"
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