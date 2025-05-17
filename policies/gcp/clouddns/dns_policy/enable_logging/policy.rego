package terraform.gcp.security.clouddns.dns_policy.enable_logging  # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_policy.vars


conditions := [
    [
    {"situation_description" : "Logs DNS queries",
    "remedies":[ "Allows capture of DNS queries"]},
    {
        "condition": "login = true",
        "attribute_path" : ["enable_logging"], 
        "values" : [true], 
        "policy_type" : "whitelist" 
    }
    ]
]
   

message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details