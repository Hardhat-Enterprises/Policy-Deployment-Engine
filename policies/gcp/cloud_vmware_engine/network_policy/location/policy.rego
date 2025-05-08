package terraform.gcp.security.cloud_vmware_engine.network_policy.location # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.network_policy.vars

conditions := [
    [
    {"situation_description" : "Network policy is within australia region",
    "remedies":[ "Use Australian regions"]},
    {
        "condition": "c1 location is either australia-southeast1 or australia-southeast2",
        "attribute_path" : ["location"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["australia-southeast1", "australia-southeast2"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details