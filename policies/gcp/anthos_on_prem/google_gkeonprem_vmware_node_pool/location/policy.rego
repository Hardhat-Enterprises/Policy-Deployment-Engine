package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_node_pool.location
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_node_pool.vars

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
    
    ]

 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details