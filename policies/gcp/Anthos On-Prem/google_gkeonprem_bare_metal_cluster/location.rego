package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_cluster.location
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_cluster.vars
 
 conditions := [
 [
    {"situation_description" : "Enforcing location to be within allowed regions",
    "remedies":[ "Change location to australia-southeast1." ],},
    {
        "condition": "Test if the location is within allowed regions",
        "attribute_path" : ["location"],
        "values" : ["australia_southeast1", "australia_southeast2"],
        "policy_type" : "whitelist" 
    }
    
    ],

 [
    {"situation_description" : "Enforcing version to be within allowed bare metal versions",
    "remedies":[ "Change bare metal version to 1.12.3." ],},
    {
        "condition": "Test if the bare metal version is within allowed versions",
        "attribute_path" : ["bare_metal_version"],
        "values" : ["1.12.3"],
        "policy_type" : "whitelist" 
    } 

    ],

    [
    {"situation_description" : "Enforcing operation system to be LINUX only",
    "remedies":[ "Change operaton system to LINUX." ],},
    {
        "condition": "Test if the operation system is LINUX",
        "attribute_path" : ["control_plane", 0,"control_plane_node_pool_config", 0,"node_pool_config", 0,"operating_system"],
        "values" : ["LINUX"],
        "policy_type" : "whitelist" 
    } 

    ],

    [
    {"situation_description" : "Enforcing load balancer port to be the secure port 443",
    "remedies":[ "Change load balancer port to 443." ],},
    {
        "condition": "Test if the load balancer port is 443",
        "attribute_path" : ["load_balancer", 0,"port_config", 0,"control_plane_load_balancer_port"],
        "values" : [443],
        "policy_type" : "whitelist" 
    }  

    ]

 ]

 result := helpers.get_multi_summary(conditions, vars.variables)

 message := result.message

 details := result.details