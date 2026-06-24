package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_cluster.load_balancer_vip_config_ingress_vip
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_cluster.vars

 conditions := [
    [
    {"situation_description" : "Enforcing vip ingress to be the chosen IP",
    "remedies":[ "Change ingress vip to 10.251.135.19." ],},
    {
        "condition": "Test if the ingress vip is the chosen IP",
        "attribute_path" : ["load_balancer", 0, "vip_config", 0, "ingress_vip"],
        "values" : ["10.251.135.19"],
        "policy_type" : "whitelist" 
    }

 ]
]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details
