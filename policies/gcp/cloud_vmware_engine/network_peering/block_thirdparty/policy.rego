package terraform.gcp.security.cloud_vmware_engine.network_peering.block_thirdparty  
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.network_peering.vars



conditions := [
    [
    {"situation_description" : "Third party peering should be blocked",
    "remedies":[ "Third party peering should be blocked"]},
    {
        "condition": "c1 Third party peering is blocked",
        "attribute_path" : ["peer_network_type"], 
        "values" : ["THIRD_PARTY_SERVICE"],
        "policy_type" : "blacklist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

details := helpers.get_multi_summary(conditions, vars.variables).details