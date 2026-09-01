package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_cluster.load_balancer_vip_config_control_plane_vip
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
    
    ]
]

 result := helpers.get_multi_summary(conditions, vars.variables)

 message := result.message

 details := result.details
