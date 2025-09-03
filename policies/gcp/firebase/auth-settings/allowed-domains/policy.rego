package terraform.gcp.security.<service>.<resource_type>.<policy_name> # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.<service>.<resource_type>.vars


conditions := [
    [
    {"situation_description" : "Firebase app is using an unapproved authentication domain",
    "remedies":[ "Use a company-approved domain ","remove extra domains"]},
    {
        "condition": "Company domain only",
        "attribute_path" : ["auth_domain"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["ankitacompany.com"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]
   


message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"


details := helpers.get_multi_summary(conditions, vars.variables).details