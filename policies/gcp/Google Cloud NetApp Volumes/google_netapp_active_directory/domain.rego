package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.domain
import data.terraform.helpers
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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
