package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_datastore.file_share
import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_datastore.vars



conditions := [
    [
    {"situation_description" :"is using an unapproved NFS file share",
    "remedies":["change the file_share to /share1"]},
   
    {
        "condition":"c1:check the cloud vmware engine datastore file share",
        "attribute_path" : ["nfs_datastore", 0, "third_party_file_service", 0, "file_share"], 
        "values" :["/share1"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details