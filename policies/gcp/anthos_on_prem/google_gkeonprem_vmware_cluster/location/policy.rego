package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_cluster.location
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_cluster.vars

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
    {"situation_description" : "Enforcing the on prem version to be 1.13.1",
    "remedies":[ "Change required platform version to 1.13.1." ],},
    {
        "condition": "Test if the on prem version is 1.13.1",
        "attribute_path" : ["on_prem_version"],
        "values" : ["1.13.1"],
        "policy_type" : "whitelist" 
    }
    
    ]

 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details