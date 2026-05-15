package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_cluster.name
import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_cluster.vars



conditions := [
    [
    {"situation_description" : "is using an unapproved cluster name",
    "remedies":[ "change the name to approved cluster name"]},
   
    {
        "condition":"c1: check the cloud vmware engine cluster name",
        "attribute_path" : ["name"], 
        "values" : ["c"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details