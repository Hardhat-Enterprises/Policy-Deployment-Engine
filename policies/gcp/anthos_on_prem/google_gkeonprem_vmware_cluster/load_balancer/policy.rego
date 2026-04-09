package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_cluster.load_balancer
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_cluster.vars

 conditions := [
 [
    {"situation_description" : "Enforcing vip control plane to be the chosen IP",
    "remedies":[ "Change control plane vip to 10.251.133.5." ],},
    {
        "condition": "Test if the control plane vip is the chosen IP",
        "attribute_path" : ["load_balancer", 0, "vip_config", 0, "control_plane_vip"],
        "values" : ["10.251.133.5"],
        "policy_type" : "whitelist" 
    }
    
    ],


 [
    {"situation_description" : "Enforcing vip ingress to be the chosen IP",
    "remedies":[ "Change ingress vip to 10.251.135.19." ],},
    {
        "condition": "Test if the ingress vip is the chosen IP",
        "attribute_path" : ["load_balancer", 0, "vip_config", 0, "ingress_vip"],
        "values" : ["10.251.135.19"],
        "policy_type" : "whitelist" 
    }

 ],

[
    {"situation_description" : "Enforcing username to be the valid format",
    "remedies":[ "Change username to testuser@gmail.com." ],},
    {
        "condition": "Test if the username is the valid format",
        "attribute_path" : ["authorization", 0, "admin_users", 0, "username"],
        "values" : ["testuser@gmail.com"],
        "policy_type" : "whitelist" 
    }

 ]



 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details