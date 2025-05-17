package terraform.gcp.security.clouddns.dns_policy.enable_inbound_forwarding # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_policy.vars


conditions := [
    [
    {"situation_description" : "Enable inbound forwarding",
    "remedies":[ "Disallows inbound forwarding"]},
    {
        "condition": "Inbound forwarding is false",
        "attribute_path" : ["enable_inbound_forwarding"], 
        "values" : [false], 
        "policy_type" : "whitelist" 
    }
    ]
]
    


message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details