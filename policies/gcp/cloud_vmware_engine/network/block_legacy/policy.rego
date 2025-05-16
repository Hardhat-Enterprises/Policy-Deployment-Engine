package terraform.gcp.security.cloud_vmware_engine.network.block_legacy  
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.network.vars

conditions := [
    [
    {"situation_description" : "Check if legacy network type is used",
    "remedies":[ "Do not use legacy network as it is being phased out now, use standard instead"]},
    {
        "condition": "c1 Legacy network is not allowed",
        "attribute_path" : ["type"], 
        "values" : ["LEGACY"], 
        "policy_type" : "blacklist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

details := helpers.get_multi_summary(conditions, vars.variables).details