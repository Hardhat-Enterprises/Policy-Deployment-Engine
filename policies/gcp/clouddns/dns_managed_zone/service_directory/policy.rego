package terraform.gcp.security.clouddns.dns_managed_zone.service_directory  
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "service directory",
    "remedies":[ "service directory for organisation"]},
    {
        "condition": "creates a service directory for private dns",
        "attribute_path" : ["service_directory_config", 0, "namespace_url", 0, "namespace_url"],
        "values" : ["google_service_directory_namespace.pde.com"], 
        "policy_type" : "whitelist" 
    }
    ]
]
    
message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details