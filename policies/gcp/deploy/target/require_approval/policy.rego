package terraform.gcp.security.deploy.target.require_approval # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.target.vars


conditions := [
    [
    {"situation_description" : "Target doesn't require approval",
    "remedies":[ "Target must require approval"]},
    {
        "condition": "Target doesn't require approval",
        "attribute_path" : ["require_approval"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [true], # Values to compare against
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