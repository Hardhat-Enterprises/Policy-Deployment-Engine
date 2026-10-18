package terraform.gcp.security.cloud_workstations.google_workstations_workstation_cluster.network
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_cluster.vars


conditions := [
    [
    {"situation_description" : "is  deployed in an unapproved network ",
    "remedies": ["change the network to an approved vpc network "]
    
    },
    {
        "condition": "c1 : check the cloud workstation cluster network",
    
        "attribute_path" : ["network"],
        "values" : ["work-station" ],
        "policy_type" : "whitelist" 
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details