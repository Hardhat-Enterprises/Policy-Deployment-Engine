package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_node_pool.on_prem_version
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_node_pool.vars

 conditions := [
 [
    {"situation_description" : "Enforcing on prem version to be 1.33.0-gke.35",
    "remedies":[ "Change on prem version to 1.33.0-gke.35." ],},
    {
        "condition": "Test if the on prem version is 1.33.0-gke.35",
        "attribute_path" : ["on_prem_version"],
        "values" : ["1.33.0-gke.35"],
        "policy_type" : "whitelist" 
    }
    
    ]

 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details