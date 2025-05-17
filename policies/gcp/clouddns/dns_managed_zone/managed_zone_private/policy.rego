package terraform.gcp.security.clouddns.dns_managed_zone.managed_zone_private # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "VPC resources that the zone is visible from",
    "remedies":[ "for private dns zones"]},
    {
        "condition": "for privately visible zones",
        "attribute_path" : ["private_visibility_config", 1, "network_url", 0], 
        "values" : [false], 
        "policy_type" : "whitelist" 
    }
    ]
]
   


message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details