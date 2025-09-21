package terraform.gcp.security.bigquery_data_policy.google_bigquery_datapolicy_data_policy.data_masking_policy.predefined_expression
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_policy.google_bigquery_datapolicy_data_policy.vars

conditions := [
    [
    {"situation_description" : "Ensure predefined expression is provided",
    "remedies":["Set predefined_expression to SHA256"]},
    {
        "condition": "Validating predefined_expression",
        "attribute_path" : ["data_masking_policy",0,"predefined_expression"],
        "values" : ["SHA256"], 
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details