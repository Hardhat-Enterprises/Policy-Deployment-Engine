package terraform.gcp.security.cloud_vmware_engine.network.allowed_location 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.network.vars

conditions := [
    [
    {"situation_description" : "Network  is within australia region",
    "remedies":[ "Use Australian regions"]},
    {
        "condition": "c1 location is either australia-southeast1 or australia-southeast2",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1", "australia-southeast2"], 
        "policy_type" : "whitelist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message


details := helpers.get_multi_summary(conditions, vars.variables).details