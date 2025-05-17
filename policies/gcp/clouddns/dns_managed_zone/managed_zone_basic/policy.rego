package terraform.gcp.security.clouddns.dns_managed_zone.managed_zone_basic # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {
        "situation_description" : "dns_managed_zone",
        "remedies":[ "disallows unauthorised namespace"]},
    {
        "condition": "Identifies valid dns namespace",
        "attribute_path" : ["private_visibility_config",1,], 
        "values" : ["PDE.example.com"], 
        "policy_type" : "whitelist"
    }
    ]
]
    
message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details