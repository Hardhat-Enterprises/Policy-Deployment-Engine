package terraform.gcp.security.clouddns.dns_managed_zone.private_peering # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "private peering setup",
    "remedies":[ "allows creation of a private peer network"]},
    {
        "condition": "sets private peering and disallows public",
        "attribute_path" : ["peering_config", 0, "network_url", 0], 
        "values" : ["private"], 
        "policy_type" : "whitelist" 
    }
    ]
]
    
message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details