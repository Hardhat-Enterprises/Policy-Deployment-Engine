package terraform.gcp.security.BigQuery.google_bigquery_routine.spark_options_container_image

import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_routine.vars

conditions := [
    [
        {
            "situation_description": "Check container image registry",
            "remedies": ["Use an approved organisational container registry"]
        },
        {
            "condition": "Reject container images from public registries",
            "attribute_path": ["spark_options", "container_image"],
            "values": [
                "*",
                [
                    ["docker.io", "quay.io", "ghcr.io"]
                ]
            ],
            "policy_type": "pattern blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
