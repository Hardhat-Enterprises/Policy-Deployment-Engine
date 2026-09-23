package terraform.gcp.security.oracle_database.google_oracle_database_db_system.properties_data_collection_options_is_incident_logs_enabled
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System has incident log and trace collection enabled to support security monitoring and investigation.",
            "remedies": [
                "Set is_incident_logs_enabled to true."
            ]
        },
        {
            "condition": "Incident log and trace collection must be enabled.",
            "attribute_path": ["properties", 0, "data_collection_options", 0, "is_incident_logs_enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details