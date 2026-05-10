package terraform.gcp.security.cloud_workstations.google_workstations_workstation.workstation_cluster_id 
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation.vars


conditions := [
    [
    {"situation_description" : "is in an unaproved workstation cluster",
    "remedies": ["change workstation_cluster_id to workstation-cluster "]
    
    },
    {
        "condition": "c1 : check the cloud workstation cluster id",
    
        "attribute_path" : ["workstation_cluster_id"],
        "values" : ["workstation-cluster" ],
        "policy_type" : "whitelist" 
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details