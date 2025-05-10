package terraform.gcp.security.cloud_vmware_engine.external_access_rule.block_ssh # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.external_access_rule.vars



conditions := [
    [
    {"situation_description" : "ip range is too broad",
    "remedies":[ "Set  ip range for required ips and make sure that all ports are not opened"]},
    {
        "condition": "c1 0.0.0.0/0 not allowed",
        "attribute_path" : ["source_ip_ranges",0,"ip_address_range"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["0.0.0.0/0"], # Values to compare against
        "policy_type" : "blacklist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    },

        {
        "condition": "c2 valid for tcp or udp",
        "attribute_path" : ["ip_protocol"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["TCP","UDP"], # Values to compare against
        "policy_type" : "blacklist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    },

    {
        "condition": "c3 check if all ports are open",
        "attribute_path" : ["source_ports",0], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["*"], # Values to compare against
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