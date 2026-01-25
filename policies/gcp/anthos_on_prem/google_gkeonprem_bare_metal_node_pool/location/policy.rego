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
    {"situation_description" : "Enforcing bare metal version to be 1.12.3",
    "remedies":[ "Change bare metal version to 1.12.3." ],},
    {
        "condition": "Test if the bare metal version is 1.12.3",
        "attribute_path" : ["bare_metal_version"],
        "values" : ["1.12.3"],
        "policy_type" : "whitelist" 
    } 

    ],

 [
    {"situation_description" : "Enforcing operating system to be LINUX",
    "remedies":[ "Change operating system to LINUX." ],},
    {
        "condition": "Test if the operating system is LINUX",
        "attribute_path" : ["node_pool_config", "operating_system"],
        "values" : ["LINUX"],
        "policy_type" : "whitelist" 
    } 

    ],

 [
    {"situation_description" : "Enforcing control plane load balancer port to be 443",
    "remedies":[ "Change port to 443" ],},
    {
        "condition": "Test if the control plane load balancer port is 443",
        "attribute_path" : ["control_plane_load_balancer", "port"],
        "values" : [443],
        "policy_type" : "whitelist" 
    } 

    ],

[
    {"situation_description" : "Enforcing node ip to be the assigned ip",
    "remedies":[ "Change node ip to 10.200.0.11" ],},
    {
        "condition": "Test if the node ip is 10.200.0.11",
        "attribute_path" : ["node_configs", "node_ip"],
        "values" : ["10.200.0.11"],
        "policy_type" : "whitelist" 
    } 

    ],


 [
    {"situation_description" : "Enforcing username to be secured admin account",
    "remedies":[ "Change username to admin@hashicorptest.com" ],},
    {
        "condition": "Test if the username is admin@hashicorptest.com",
        "attribute_path" : ["security_config", "authorization", "admin_users", "username"],
        "values" : ["admin@hashicorptest.com"],
        "policy_type" : "whitelist" 
    } 

    ]

 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details