package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_admin_cluster.location
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_admin_cluster.vars

 conditions := [
 [
    {"situation_description" : "Enforcing location to be us-west1",
    "remedies":[ "Change location to us-west1." ],},
    {
        "condition": "Test if the location is us-west1",
        "attribute_path" : ["location"],
        "values" : ["us-west1"],
        "policy_type" : "whitelist" 
    }
    
    ],


 [
    {"situation_description" : "Enforcing on prem version to be 1.31.0",
    "remedies":[ "Change on prem version to 1.31.0." ],},
    {
        "condition": "Test if the on prem version is 1.31.0",
        "attribute_path" : ["on_prem_version"],
        "values" : ["1.31.0"],
        "policy_type" : "whitelist" 
    } 

    ]


 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details