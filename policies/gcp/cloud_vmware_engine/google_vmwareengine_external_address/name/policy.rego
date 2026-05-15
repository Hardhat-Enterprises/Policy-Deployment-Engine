package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_external_address.name
import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_external_address.vars



conditions := [
    [
    {"situation_description" :"is using an unapproved external address name",
    "remedies":["change the name to an approved name"]},
   
    {
        "condition":"c1: check the cloud vmware engine external address name",
        "attribute_path" : ["name"],
        "values" :["c"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details