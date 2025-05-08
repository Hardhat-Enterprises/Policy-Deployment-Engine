package terraform.gcp.security.parameter_manager.parameter.encryption # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.parameter_manager.parameter.vars

conditions := [
    [
    {"situation_description" : "Parameters should be encrypted",
    "remedies":[ "Enable kms"]},
    {
        "condition": "c1 Parameter is not encrypted",
        "attribute_path" : ["kms_key"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [null], # Values to compare against
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