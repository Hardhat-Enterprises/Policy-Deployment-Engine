package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_datastore.servers
import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_datastore.vars



conditions := [
    [
    {"situation_description" :"is using an unapproved NFS server",
    "remedies":["change/remove unapproved server IP addresses from servers"]},
   
    {
        "condition":"c1: check the cloud vmware engine datastore NFS servers",
        "attribute_path" :  ["nfs_datastore", 0, "third_party_file_service", 0, "servers", 0], 
        "values" :["10.0.0.4"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details