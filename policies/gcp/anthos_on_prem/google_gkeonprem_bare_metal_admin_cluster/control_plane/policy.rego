package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.control_plane
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.vars
 
 conditions := [
 [
    {"situation_description" : "Enforcing node IP to be the assigned private IP",
    "remedies":[ "Change node IP to be private." ],},
    {
        "condition": "Test if the node IP is within the assigned private IP range",
        "attribute_path" : ["control_plane","control_plane_node_pool_config","node_pool_config","node_configs","node_ip"],
        "values" : ["10.200.0.2","10.200.0.3","10.200.0.4"],
        "policy_type" : "whitelist" 
    }
    
    ],

 [
    {"situation_description" : "Enforcing operation system to be Linux",
    "remedies":[ "Change operation system to Linux." ],},
    {
        "condition": "Test if the operation system is Linux",
        "attribute_path" : ["control_plane","control_plane_node_pool_config","node_pool_config","operating_system"],
        "values" : ["LINUX"],
        "policy_type" : "whitelist" 
    }

    ]

 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details