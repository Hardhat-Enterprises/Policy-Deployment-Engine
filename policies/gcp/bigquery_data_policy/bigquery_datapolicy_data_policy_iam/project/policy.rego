package terraform.gcp.security.bigquery_data_policy.bigquery_datapolicy_data_policy_iam.project
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_policy.bigquery_datapolicy_data_policy_iam.vars

conditions := [
    [
    {"situation_description" : "Ensure project is provided",
    "remedies":["Set project to PDE"]},
    {
        "condition": "Validating project",
        "attribute_path" : ["project"],
        "values" : ["PDE"], 
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details