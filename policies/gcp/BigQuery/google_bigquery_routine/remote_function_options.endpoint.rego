package terraform.gcp.security.bigquery.google_bigquery_routine.remote_function_options_endpoint

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_routine.vars

conditions := [
    [
        {
            "situation_description": "Check remote function endpoint uses HTTPS",
            "remedies": ["Use an HTTPS endpoint"]
        },
        {
            "condition": "Require HTTPS for remote function endpoint",
            "attribute_path": ["remote_function_options", 0, "endpoint"],
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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
