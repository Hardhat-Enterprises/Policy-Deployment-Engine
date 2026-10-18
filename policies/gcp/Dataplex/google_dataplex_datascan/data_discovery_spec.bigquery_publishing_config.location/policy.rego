package terraform.gcp.security.dataplex.google_dataplex_datascan.data_discovery_spec_bigquery_publishing_config_location

import data.terraform.gcp.security.dataplex.google_dataplex_datascan.vars
import data.terraform.helpers

conditions := [
        [
                {
                        "situation_description": "The BigQuery publishing location is outside approved Australian regions.",
                        "remedies": [
                                "Set data_discovery_spec.bigquery_publishing_config.location to australia-southeast1 or australia-southeast2.",
                        ],
                },
                {
                        "condition": "BigQuery publishing must use an approved Australian region.",
                        "attribute_path": ["data_discovery_spec", 0, "bigquery_publishing_config", 0, "location"],
                        "values": ["australia-southeast1", "australia-southeast2"],
                        "policy_type": "whitelist",
                },
        ],
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
