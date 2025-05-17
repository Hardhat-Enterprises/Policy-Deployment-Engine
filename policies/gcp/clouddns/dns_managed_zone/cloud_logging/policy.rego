package terraform.gcp.security.clouddns.dns_managed_zone.cloud_logging # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "cloud logging",
    "remedies":[ "enables cloud logging"]},
    {
        "condition": "cloud logging in enable dns zone",
        "attribute_path" : ["cloud_logging"], 
        "values" : [true], 
        "policy_type" : "whitelist" 
    }
    ]
]
    
message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details