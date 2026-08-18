package terraform.gcp.security.BigQuery.google_bigquery_routine.remote_function_options_endpoint

import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_routine.vars

conditions := [
    [
        {
            "situation_description": "Check remote function endpoint uses HTTPS",
            "remedies": ["Use an HTTPS endpoint"]
        },
        {
            "condition": "Require HTTPS for remote function endpoint",
            "attribute_path": ["remote_function_options", "endpoint"],
            "values": [
                "*://",
                [
                    ["https"]
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
