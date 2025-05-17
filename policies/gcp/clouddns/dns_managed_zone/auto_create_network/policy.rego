package terraform.gcp.security.clouddns.dns_managed_zone.auto_create_network # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "managing network auto-creation",
    "remedies":[ "prevents auto-propagating of networks"]},
    {
        "condition": "Disallows auto-creation of networks",
        "attribute_path" : ["auto_create_network"], 
        "values" : [false], 
        "policy_type" : "whitelist" 
    }
    ]
]
   

message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details