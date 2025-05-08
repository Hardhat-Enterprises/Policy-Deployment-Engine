package terraform.gcp.security.cloud_vmware_engine.network_peering.block_custom_routes # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.network_peering.vars



conditions := [
    [
    {"situation_description" : "Custom routes with public ip should be blocked",
    "remedies":[ "Set public ip to false for custom routes"]},
    {
        "condition": "c1 Custom routes with public ip is blocked",
        "attribute_path" : ["import_custom_routes_with_public_ip"], # An array of strings and indicies eg. ["rsa",0,"key"]
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