package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_admin_cluster.load_balancer
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_admin_cluster.vars

 conditions := [
 [
    {"situation_description" : "Enforcing control plane vip to be the chosen IP",
    "remedies":[ "Change control plane vip to 10.251.133.5." ],},
    {
        "condition": "Test if the control plane vip is the chosen IP",
        "attribute_path" : ["load_balancer", 0, "vip_config", 0, "control_plane_vip"],
        "values" : ["10.251.133.5"],
        "policy_type" : "whitelist" 
    }
    
    ]

 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details