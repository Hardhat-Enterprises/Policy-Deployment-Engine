package terraform.gcp.security.clouddns.dns_managed_zone.directory_namespace # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "directory namespace",
    "remedies":["creates a namespace, location for service directory"]},
    {
        "condition": "service directory namespace",
        "attribute_path" : ["directory_namespace"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [""], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]
    
message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details