package terraform.gcp.security.BigQuery.google_bigquery_routine.security_mode

import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_routine.vars

conditions := [
    [
        {
            "situation_description": "Check for valid security_mode",
            "remedies": ["Set security_mode to INVOKER"]
        },
        {
            "condition": "Check for valid security_mode",
            "attribute_path": ["security_mode"],
            "values": "INVOKER",
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
