package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_cluster.node_type_id
import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_cluster.vars



conditions := [
    [
    {"situation_description" : "is using an unapproved node type",
    "remedies":["change the node_type_id to standard-72"]},
   
    {
        "condition":"c1: check the cloud vmware engine cluster node type",
        "attribute_path" : ["node_type_configs", 0, "node_type_id"], 
        "values" :["standard-72"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details