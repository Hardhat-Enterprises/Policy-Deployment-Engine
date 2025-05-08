package terraform.gcp.security.cloud_vmware_engine.network_peering.block_thirdparty # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.network_peering.vars



conditions := [
    [
    {"situation_description" : "Third party peering should be blocked",
    "remedies":[ "Third party peering should be blocked"]},
    {
        "condition": "c1 Third party peering is blocked",
        "attribute_path" : ["peer_network_type"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["THIRD_PARTY_SERVICE"], # Values to compare against
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