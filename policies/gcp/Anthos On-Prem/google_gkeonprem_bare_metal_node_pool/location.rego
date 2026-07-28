package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_node_pool.location
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_node_pool.vars

 conditions := [
 [
    {"situation_description" : "Enforcing location to be within australia",
    "remedies":[ "Change location to australia-southeast1." ],},
    {
        "condition": "Test if the location is australia-southeast1",
        "attribute_path" : ["location"],
        "values" : ["australia_southeast1", "australia_southeast2"],
        "policy_type" : "whitelist" 
    }
    
    ],
 [
    {"situation_description" : "Enforcing operating system to be LINUX",
    "remedies":[ "Change operating system to LINUX." ],},
    {
        "condition": "Test if the operating system is LINUX",
        "attribute_path" : ["node_pool_config", 0,"operating_system"],
        "values" : ["LINUX"],
        "policy_type" : "whitelist" 
    } 

    ],

[
    {"situation_description" : "Enforcing node ip to be the assigned ip",
    "remedies":[ "Change node ip to 10.200.0.11" ],},
    {
        "condition": "Test if the node ip is 10.200.0.11",
        "attribute_path" : ["node_pool_config", 0,"node_configs", 0, "node_ip"],
        "values" : ["10.200.0.11"],
        "policy_type" : "whitelist" 
    } 

    ]

 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details