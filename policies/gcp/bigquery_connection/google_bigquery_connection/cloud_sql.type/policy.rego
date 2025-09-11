package terraform.gcp.security.bigquery_connection.google_bigquery_connection.cloud_sql.type 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars


conditions := [
    [
    {"situation_description" : "Require explicit supported Cloud SQL type",
    "remedies":[ "Set cloud_sql.type to POSTGRES or MYSQL" ]},
    {
        "condition": "cloud_sql.type must be one of the approved values",
        "attribute_path" : ["cloud_sql", 0, "type"], 
        "values" : ["POSTGRES","MYSQL"], 
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
