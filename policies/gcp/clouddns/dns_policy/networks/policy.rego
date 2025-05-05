package terraform.gcp.security.clouddns.dns_policy.networks # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_policy.vars


conditions := [
    [
    {"situation_description" : "Allowed network",
    "remedies":[ "Blocks unauthorised networks"]},
    {
        "condition": "Whitelists allowed networks",
        "attribute_path" : ["networks"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]
    

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details