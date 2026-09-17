package terraform.gcp.security.google_alloydb_instance.query_insights_config.record_application_tags

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [
    [
        {
            "situation_description": "The AlloyDB instance should record application tags in Query Insights to support security monitoring and audit visibility.",
            "remedies": [
                "Enable application tag recording in Query Insights.",
                "Set query_insights_config.record_application_tags to true."
            ]
        },
        {
            "condition": "The record_application_tags attribute must be set to true.",
            "attribute_path": [
                "query_insights_config",
                0,
                "record_application_tags"
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