package terraform.gcp.security.clouddns.dns_policy.alt_name_server 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_policy.vars


conditions := [
    [
        {
            "situation_description" : "Alternative server",
            "remedies": ["Allows use of a single alternative server if needed"]
        },
        {
            "condition": "Use alt server if main is unavailable",
            "attribute_path" : ["alternative_name_server_config", 1, "ipv4_address", 0], 
            "values" : [], 
            "policy_type" : "whitelist" 
        }
    ]
]
    

message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details