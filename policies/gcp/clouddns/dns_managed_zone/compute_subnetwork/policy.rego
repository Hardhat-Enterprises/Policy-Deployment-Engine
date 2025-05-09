package terraform.gcp.security.clouddns.dns_managed_zone.compute_subnetwork # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "compute sub-networks",
    "remedies":[ "Disallows random sub-network creation"]},
    {
        "condition": "restricts sub-network creation to allowed range",
        "attribute_path" : ["compute_subnetwork"], 
        "values" : ["10.0.36.0/24"], 
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]
    


message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details