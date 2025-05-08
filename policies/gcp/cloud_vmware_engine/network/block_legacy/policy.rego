package terraform.gcp.security.cloud_vmware_engine.network.block_legacy # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.network.vars

conditions := [
    [
    {"situation_description" : "Legacy network should be blocked",
    "remedies":[ "Legacy network should be blocked"]},
    {
        "condition": "c1 Legacy network is not allowed",
        "attribute_path" : ["type"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["LEGACY"], # Values to compare against
        "policy_type" : "blacklist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details