package terraform.gcp.security.clouddns.dns_managed_zone.private_gke # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "gke cluster name",
    "remedies":[ "describes gke cluster name"]},
    {
        "condition": "whitelist for private gke cluster name",
        "attribute_path" : ["private_gke"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details