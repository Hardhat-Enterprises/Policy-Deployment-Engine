package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.load_balancer_port_config_control_plane_load_balancer_port
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.vars
 
 conditions := [
    [
    {"situation_description" : "Enforcing the laod balancer port to be 443",
    "remedies":[ "Change port to 433." ],},
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
