package terraform.gcp.security.cloud_vmware_engine.network_policy.block_external_ip # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.network_policy.vars

conditions := [
    [
    {"situation_description" : "External IP address is blocked",
    "remedies":[ "External IPs should not be allocated"]},
    {
        "condition": "c1 External IPs are blocked",
        "attribute_path" : ["external_ip",0,"enabled"], # An array of strings and indicies eg. ["rsa",0,"key"]
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