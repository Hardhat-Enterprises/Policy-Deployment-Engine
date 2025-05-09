package terraform.gcp.security.clouddns.dns_managed_zone.auto_create_network # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "managing network auto-creation",
    "remedies":[ "prevents auto-propagating of networks"]},
    {
        "condition": "Disallows auto-creation of networks",
        "attribute_path" : ["auto_create_network"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["auto-creation = false"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]
   
# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details