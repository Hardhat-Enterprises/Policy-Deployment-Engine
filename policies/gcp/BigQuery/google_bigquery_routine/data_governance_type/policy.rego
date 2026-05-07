package terraform.gcp.security.BigQuery.google_bigquery_routine.data_governance_type
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_routine.vars

conditions := [
    [
        {"situation_description" : "Check for valid data_governance_type",
         "remedies": ["Add valid data_governance_type"]},
        {
            "condition": "Check for valid_data_governance_type",
            "attribute_path": ["data_governance_type"],
            "values" : "DATA_MASKING", 
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details