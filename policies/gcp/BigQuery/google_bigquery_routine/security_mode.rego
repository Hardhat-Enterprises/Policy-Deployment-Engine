package terraform.gcp.security.bigquery.google_bigquery_routine.security_mode
import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_routine.vars

conditions := [
    [
        {"situation_description" : "Check for valid security_mode",
         "remedies": ["Add valid security_mode"]},
        {
            "condition": "Check for valid_security_mode",
            "attribute_path": ["security_mode"],
            "values" : "DEFINER", 
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details