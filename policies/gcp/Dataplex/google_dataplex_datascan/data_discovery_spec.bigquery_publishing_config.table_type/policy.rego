package terraform.gcp.security.dataplex.google_dataplex_datascan.data_discovery_spec_bigquery_publishing_config_table_type

import data.terraform.gcp.security.dataplex.google_dataplex_datascan.vars
import data.terraform.helpers

conditions := [
        [
                {
                        "situation_description": "The BigQuery publishing table type is not explicitly configured to a supported value.",
                        "remedies": [
                                "Set data_discovery_spec.bigquery_publishing_config.table_type to EXTERNAL or BIGLAKE.",
                        ],
                },
                {
                        "condition": "BigQuery publishing must use an explicit supported table type.",
                        "attribute_path": ["data_discovery_spec", 0, "bigquery_publishing_config", 0, "table_type"],
                        "values": ["EXTERNAL", "BIGLAKE"],
                        "policy_type": "whitelist",
                },
        ],
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
