package terraform.gcp.security.clouddns.dns_managed_zone.private_forwarding # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "permitted forwarding ip4 addresses",
    "remedies":[ "random ipv4 address allocation"]},
    {
        "condition": "specifies whitelisted ip4 addresses for forwarding",
        "attribute_path" : ["private_forwarding"], 
        "values" : [], 
        "policy_type" : "whitelist" 
    }
    ]
]
    
# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details