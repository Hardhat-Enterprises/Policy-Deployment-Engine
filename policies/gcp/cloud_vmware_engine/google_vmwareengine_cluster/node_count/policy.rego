package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_cluster.node_count
import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_cluster.vars



conditions := [
    [
    {"situation_description" : "is using an unapproved node count",
    "remedies":["change the node_count to 3 "]},
   
    {
        "condition":"c1: check the cloud vmware engine cluster node count",
        "attribute_path" : ["node_type_configs", 0, "node_count"], 
        "values" :[3],
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details