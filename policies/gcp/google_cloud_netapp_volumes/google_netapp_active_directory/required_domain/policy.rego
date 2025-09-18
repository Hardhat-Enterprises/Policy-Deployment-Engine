package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.required_domain  
import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars


conditions := [
    [
        {"situation_description" : "Domain must be deakin.internal",
         "remedies":[ "Set domain to \"deakin.internal\" in the Terraform config"]},
        {
        "condition": "pdomain equals deakin.internal",
        "attribute_path" : ["domain"], 
        "values" : ["deakin.internal"], 
        "policy_type" : "whitelist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details