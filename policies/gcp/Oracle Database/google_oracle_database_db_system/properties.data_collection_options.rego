package terraform.gcp.security.oracle_database.google_oracle_database_db_system.properties_data_collection_options

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System must have data collection options configured to support security monitoring, privacy, and compliance requirements.",
            "remedies": [
                "Configure the data_collection_options block with appropriate data collection settings."
            ]
        },
        {
            "condition": "The data_collection_options block must be configured.",
            "attribute_path": ["properties", 0, "data_collection_options"],
            "values": [null, [], "__NOT_CONFIGURED__"],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details