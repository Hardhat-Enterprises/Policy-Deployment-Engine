package terraform.gcp.security.clouddns.dns_managed_zone.private_forwarding # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "permitted forwarding ip4 addresses",
    "remedies":[ "random ipv4 address allocation"]},
    {
        "condition": "specifies whitelisted ip4 addresses for forwarding",
        "attribute_path" : ["forwarding_config", 0, "target_name_servers", 1, "ipv4_address"], 
        "values" : ["139.0.0.1"], 
        "policy_type" : "whitelist" 
    }
    ]
]
    

message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details