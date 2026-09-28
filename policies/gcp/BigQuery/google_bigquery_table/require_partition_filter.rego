package terraform.gcp.security.bigquery.google_bigquery_table.require_partition_filter

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_table.vars

conditions := [
    [
        {
            "situation_description": "Check require_partition_filter is enabled",
            "remedies": ["Set require_partition_filter to true"]
        },
        {
            "condition": "Require partition filter on queries",
            "attribute_path": ["require_partition_filter"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
