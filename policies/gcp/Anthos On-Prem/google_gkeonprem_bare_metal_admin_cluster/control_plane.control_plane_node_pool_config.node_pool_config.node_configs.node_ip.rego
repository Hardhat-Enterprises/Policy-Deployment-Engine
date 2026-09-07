package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.control_plane_control_plane_node_pool_config_node_pool_config_node_configs_node_ip
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.vars
 
 conditions := [
    [
    {"situation_description" : "Enforcing node IP to be the assigned private IP",
    "remedies":[ "Change node IP to be private." ],},
    {
        "condition": "Test if the node IP is within the assigned private IP range",
        "attribute_path" : ["control_plane", 0,"control_plane_node_pool_config", 0,"node_pool_config", 0,"node_configs", 0,"node_ip"],
        "values" : ["10.200.0.2","10.200.0.3","10.200.0.4"],
        "policy_type" : "whitelist" 
    }
    
    ]
]

 result := helpers.get_multi_summary(conditions, vars.variables)

 message := result.message

 details := result.details
