package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_datastore.location
import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_datastore.vars



conditions := [
    [
    {"situation_description" :"is deployed in an unapproved location",
    "remedies":["change the location to us-west1-a"]},
   
    {
        "condition":"c1: check the cloud vmware engine datastore location",
        "attribute_path" : ["location"], 
        "values" :["us-west1-a"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details