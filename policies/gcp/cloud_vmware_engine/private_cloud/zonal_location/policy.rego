package terraform.gcp.security.cloud_vmware_engine.private_cloud.zonal_location  
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.private_cloud.vars

conditions := [
    [
    {"situation_description" : "Cloud is within australia zone",
    "remedies":[ "Use Australian zones"]},
    {
        "condition": "c1 primary location is either between australia-southeast 11,1b,1c or australia-southeast 2a,2b,2c",
        "attribute_path" : ["management_cluster",0,"stretched_cluster_config",0,"preferred_location"], 
        "values" : ["projects/projectabc/locations/*",[["australia-southeast1-a", "australia-southeast1-b","australia-southeast1-c","australia-southeast2-a","australia-southeast2-b","australia-southeast2-c"]]], 
        "policy_type" : "pattern whitelist" 
    },

        {
        "condition": "c2 secondary location is either between australia-southeast 11,1b,1c or australia-southeast 2a,2b,2c",
        "attribute_path" : ["management_cluster",0,"stretched_cluster_config",0,"secondary_location"],
        "values" : ["projects/projectabc/locations/*",[["australia-southeast1-a", "australia-southeast1-b","australia-southeast1-c","australia-southeast2-a","australia-southeast2-b","australia-southeast2-c"]]],
        "policy_type" : "pattern whitelist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message


details := helpers.get_multi_summary(conditions, vars.variables).details