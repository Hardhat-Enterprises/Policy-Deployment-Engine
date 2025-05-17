package terraform.gcp.security.clouddns.dns_policy.networks # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_policy.vars


conditions := [
    [
    {"situation_description" : "Allowed network",
    "remedies":[ "Blocks unauthorised networks"]},
    {
        "condition": "Whitelists allowed networks",
        "attribute_path" : ["networks", 0, "network_url", 0], 
        "values" : [true], 
        "policy_type" : "whitelist" 
    }
    ]
]
    

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details