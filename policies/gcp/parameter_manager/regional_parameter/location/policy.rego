package terraform.gcp.security.parameter_manager.regional_parameter.location # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.parameter_manager.regional_parameter.vars

conditions := [
    [
    {"situation_description" : "Parameters should be in Aus location",
    "remedies":[ "Change regions to Aus"]},
    {
        "condition": "c1 Region is not Aus",
        "attribute_path" : ["location"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["australia-southeast1","australia-southeast2"], # Values to compare against
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