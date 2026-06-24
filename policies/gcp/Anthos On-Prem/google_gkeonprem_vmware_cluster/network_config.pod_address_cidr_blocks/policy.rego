package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_cluster.network_config_pod_address_cidr_blocks
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_cluster.vars

 conditions := [
    [
    {"situation_description" : "Enforcing pod address cidr blocks to be the assigned IP",
    "remedies":[ "Change pod address cidr blocks to 192.168.0.0/16." ],},
    {
        "condition": "Test if the pod address cidr blocks is the assigned IP",
        "attribute_path" : ["network_config", 0, "pod_address_cidr_blocks"],
        "values" : ["192.168.0.0/16"],
        "policy_type" : "whitelist" 
    } 

    ]
]


 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details
