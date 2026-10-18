package terraform.gcp.security.bigquery.google_bigquery_table.external_data_configuration_hive_partitioning_options_require_partition_filter

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_table.vars

conditions := [
    [
        {
            "situation_description": "Check hive partitioning require_partition_filter is enabled",
            "remedies": ["Set external_data_configuration.hive_partitioning_options.require_partition_filter to true"]
        },
        {
            "condition": "Require partition filter on hive-partitioned external data",
            "attribute_path": ["external_data_configuration", 0, "hive_partitioning_options", 0, "require_partition_filter"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
