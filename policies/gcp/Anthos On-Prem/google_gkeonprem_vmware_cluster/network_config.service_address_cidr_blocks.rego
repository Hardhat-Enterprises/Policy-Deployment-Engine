package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_cluster.network_config_service_address_cidr_blocks
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_cluster.vars

 conditions := [
    [
    {"situation_description" : "Enforcing service address cidr blocks to be the assigned IP",
    "remedies":[ "Change service address cidr blocks to 10.96.0.0/12." ],},
    {
        "condition": "Test if the service address cidr blocks is the assigned IP",
        "attribute_path" : ["network_config", 0, "service_address_cidr_blocks"],
        "values" : ["10.96.0.0/12"],
        "policy_type" : "whitelist" 
    }
    
    ]
]


 result := helpers.get_multi_summary(conditions, vars.variables)

 message := result.message

 details := result.details
