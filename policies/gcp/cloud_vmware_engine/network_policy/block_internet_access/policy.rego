package terraform.gcp.security.cloud_vmware_engine.network_policy.block_internet_access 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.network_policy.vars

conditions := [
    [
    {"situation_description" : "Internet access is blocked",
    "remedies":[ "Block internet access"]},
    {
        "condition": "c1 Internet access should be disabled",
        "attribute_path" : ["internet_access",0,"enabled"], 
        "values" : [false], 
        "policy_type" : "whitelist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

details := helpers.get_multi_summary(conditions, vars.variables).details