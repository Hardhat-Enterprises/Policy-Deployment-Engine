package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_node_pool.node_pool_autoscaling_min_replicas
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_node_pool.vars

 conditions := [
    [
    {"situation_description" : "Enforcing the minimum replicas to be at least 1 for autoscaling node pools.",
    "remedies":[ "Change min_replicas to 1." ],},
    {
        "condition": "Test if the min_replicas is less than 1.",
        "attribute_path" : ["node_pool_autoscaling", "min_replicas"],
        "values" : [1],
        "policy_type" : "whitelist" 
    }
    
    ]
]

 result := helpers.get_multi_summary(conditions, vars.variables)

 message := result.message

 details := result.details
