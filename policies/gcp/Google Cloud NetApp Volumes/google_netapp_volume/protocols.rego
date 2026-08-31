package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume.protocols
import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume.vars


conditions := [
    [
        {"situation_description" : "Block older/unsupported protocols",
         "remedies":[ "Remove NFSv3 or SMB from the list"]},
        {
        "condition": "protocols must not include NFSv3 or SMB",
        "attribute_path" : ["protocols", 0], 
        "values" : ["NFSV3", "SMB"], 
        "policy_type" : "blacklist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
