package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_node_pool.autoscaling
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
    
    ],

[
    {"situation_description" : "Enforcing the maximum replicas to be at most 5 for autoscaling node pools.",
    "remedies":[ "Change max_replicas to 5." ],},
    {
        "condition": "Test if the max_replicas is greater than 5.",
        "attribute_path" : ["node_pool_autoscaling", "max_replicas"],
        "values" : [5],
        "policy_type" : "whitelist" 
    }
    ]
    
 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details