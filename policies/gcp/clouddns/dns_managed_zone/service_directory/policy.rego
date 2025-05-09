package terraform.gcp.security.clouddns.dns_managed_zone.service_directory # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "service directory",
    "remedies":[ "service directory for organisation"]},
    {
        "condition": "creates a service directory for private dns",
        "attribute_path" : ["service_directory"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [""], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]
    
message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details