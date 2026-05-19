package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_subnet.parent
import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_subnet.vars



conditions := [
    [
    {"situation_description" : "is created under an unapproved private cloud parent",
    "remedies":[ ["change the parent to an approved private cloud parent"]]},
   
    {
        "condition":"c1:  check the cloud vmware engine subnet parent",
        "attribute_path" : ["parent"],
        "values" :["projects/599444694846/locations/us-west1-a/privateClouds/c"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details