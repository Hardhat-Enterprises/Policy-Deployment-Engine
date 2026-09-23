package terraform.gcp.security.oracle_database.google_oracle_database_db_system.properties_data_collection_options_is_diagnostics_events_enabled
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System has diagnostics event collection enabled to support security monitoring and investigation.",
            "remedies": [
                "Set is_diagnostics_events_enabled to true."
            ]
        },
        {
            "condition": "Diagnostics event collection must be enabled.",
            "attribute_path": ["properties", 0, "data_collection_options", 0, "is_diagnostics_events_enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details