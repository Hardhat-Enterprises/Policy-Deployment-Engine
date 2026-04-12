package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.location
import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
    {"situation_description" : "Prevent Terraform from using location outside Australia",
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