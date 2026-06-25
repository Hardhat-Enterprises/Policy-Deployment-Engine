package terraform.gcp.security.cloud_workstations.google_workstations_workstation_iam_policy.workstation_cluster_id
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_iam_policy.vars


conditions := [
    [
    {"situation_description" : "IAM policy must be in a correct workstation cluster",
    "remedies": ["change workstation_cluster_id to workstation-cluster "]
    
    },
    {
        "condition": "c1 : check workstation_cluster_id is correct",
    
        "attribute_path" :  ["workstation_cluster_id"],
        "values" :  ["workstation-cluster"],
        "policy_type" :  "whitelist"
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details