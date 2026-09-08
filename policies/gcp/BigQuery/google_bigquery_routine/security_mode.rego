package terraform.gcp.security.bigquery.google_bigquery_routine.security_mode

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_routine.vars


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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details