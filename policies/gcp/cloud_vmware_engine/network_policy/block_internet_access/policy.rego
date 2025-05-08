package terraform.gcp.security.cloud_vmware_engine.network_policy.block_internet_access # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.network_policy.vars

conditions := [
    [
    {"situation_description" : "Internet access is blocked",
    "remedies":[ "Block internet access"]},
    {
        "condition": "c1 Internet access should be disabled",
        "attribute_path" : ["internet_access",0,"enabled"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [false], # Values to compare against
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