package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_cluster.vip_config
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_cluster.vars
 
 conditions := [
 [
    {"situation_description" : "Enforcing vip IPs to be assigned private IPs",
    "remedies":[ "Change IPs to assigned private IPs." ],},
    {
        "condition": "Test if the vip IPs are assigned private IPs",
        "attribute_path" : ["load_balancer", 0, "vip_config", 0, "control_plane_vip"],
        "values" : ["10.200.0.13","10.200.0.14"],
        "policy_type" : "whitelist" 
    }
    
    ],

 [
    {"situation_description" : "Enforcing username to be secured admin account",
    "remedies":[ "Change username to admin@hashicorptest.com" ],},
    {
        "condition": "Test if the username is admin@hashicorptest.com",
        "attribute_path" : ["security_config", 0, "authorization", 0, "admin_users", 0, "username"],
        "values" : ["admin@hashicorptest.com"],
        "policy_type" : "whitelist" 
    } 

    ]

 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details