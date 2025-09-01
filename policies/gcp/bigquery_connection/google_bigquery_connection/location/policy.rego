package terraform.gcp.security.bigquery_connection.google_bigquery_connection.location 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [
    [
    {"situation_description" : "Prevent Terraform from using loaction outside Australia",
    "remedies":["Use regions in Australia"]},
    {
        "condition": "Use regions in Australia",
        "attribute_path" : ["location"], 
        "values" : ["australia-southeast2","australia-southeast1" ], 
        "policy_type" : "whitelist" 
    }
    ]
]
   

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details